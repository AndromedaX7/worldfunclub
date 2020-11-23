package com.ds.worldfunclub.base

import android.Manifest
import android.app.Activity
import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.provider.OpenableColumns
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.FileProvider
import androidx.core.net.toFile
import java.io.*
import java.util.*
import kotlin.random.Random

open class Upload2Model(val internalActivity: AppCompatActivity) : BaseModel(internalActivity) {


    val photoId = "com.ds.worldfunclub.fileProvider"
    var file: File? = null
    var currentToken = ""
    var tokenMap = HashMap<String, String>()
    val newFile: File
        get() {
            val camera = File(internalActivity.cacheDir, "camera")
            if (!camera.exists())
                camera.mkdirs()
            file = File(camera, System.currentTimeMillis().toString() + ".jpg")
            try {
                file!!.createNewFile()
            } catch (e: IOException) {
                e.printStackTrace()
            }
            return file!!
        }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == req_camera_out_put && resultCode == Activity.RESULT_OK) {
//            val uriForFile = FileProvider.getUriForFile(context, photoId, File(tokenMap[currentToken]!!))
//            Log.e("Uri :", uriForFile.toString())
            photoResult(currentToken, tokenMap[currentToken])
            tokenMap.remove(currentToken)
            currentToken = ""
        } else if (requestCode == req_photos_out_put && resultCode == Activity.RESULT_OK) {
            Log.e("Uri :", data!!.data.toString())
            photoResult(
                currentToken,
//                PhotoFromPhotoAlbum.getRealPathFromUri(internalActivity, data.data)
                data .data!!.toFile(internalActivity)!!.absolutePath
            )
            tokenMap.remove(currentToken)
        } else if (requestCode == req_camera_out_put2 && resultCode == Activity.RESULT_OK) {
            try {
                photoResult(
                    Uri.parse(
                        MediaStore.Images.Media.insertImage(
                            internalActivity.contentResolver,
                            tokenMap[currentToken],
                            null,
                            null
                        )
                    ), tokenMap[currentToken]
                )
            } catch (e: FileNotFoundException) {
                e.printStackTrace()
            }
        }
    }

    fun zipImageUpload(filePath: String?, callback: (String) -> Unit) {
        filePath?.let {
            Thread {
                val bitmap = BitmapFactory.decodeFile(it)
                try {
                    val op = internalActivity.contentResolver.openOutputStream(
                        FileProvider.getUriForFile(
                            internalActivity,
                            photoId,
                            File(filePath)
                        )
                    )
                    val buff = BufferedOutputStream(op)
                    val out = ByteArrayOutputStream()
                    bitmap.compress(Bitmap.CompressFormat.JPEG, 30, out)
                    val bytes = out.toByteArray()
                    buff.write(bytes)
                    buff.close()
//                        val req = HttpReq(this@Upload2Model)
//                        req.qiNiuYunToken(
//                            ExtensionFunction.loadToken(context),
//                            object : HttpCallback<TokenCdn?>() {
//                                fun response(cdn: TokenCdn) {
//                                    if (cdn.isSuccess()) {
//                                        val data: TokenCdn.BodyBean.DataBean =
//                                            cdn.getBody().getData()
//                                        val domain: String = data.getDomain()
//                                        val upToken: String = data.getUpToken()
//                                        req.uploadcdn(upToken, bytes, object : CallbackString() {
//                                            fun callback(args: String) {
//                                                callback.callback(domain + args)
//                                            }
//                                        })
//                                    }
//                                }
//
//                                fun exception(e: Throwable) {
//                                    e.printStackTrace()
//                                }
//                            })
                } catch (e: FileNotFoundException) {
                    e.printStackTrace()
                } catch (e: IOException) {
                    e.printStackTrace()
                }
            }.start()
        }


    }

    fun reqCamera(activity: Activity, file: File?, reqcode: Int): Uri? {
        var uri: Uri? = null
        val intent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
        uri = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            FileProvider.getUriForFile(context, photoId, file!!)
        } else {
            Uri.fromFile(file)
        }
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        intent.putExtra(MediaStore.EXTRA_OUTPUT, uri)
        activity.startActivityForResult(intent, reqcode)
        return uri
    }

    fun openCamera(token: String) {
        currentToken = token
        reqPermission(Manifest.permission.CAMERA, req_camera_out_put) {
            newFile
            tokenMap[token] = file!!.absolutePath
            reqCamera(internalActivity, file, req_camera_out_put)
        }
    }

    fun openCamera2(token: String) {
        currentToken = token
        reqPermission(Manifest.permission.CAMERA, req_camera_out_put2) {
            newFile
            tokenMap[token] = file!!.absolutePath
            reqCamera(context as AppCompatActivity, file, req_camera_out_put2)
        }
    }

    fun openPhotos(token: String) {
        currentToken = token
        val intent = Intent()
        intent.action = Intent.ACTION_PICK
        intent.type = "image/*"
        (context as Activity).startActivityForResult(intent, req_photos_out_put)
    }

    open fun photoResult(token: String?, filePath: String?) {}
    open fun photoResult(uri: Uri?, path: String?) {}

    companion object {
        const val req_camera_out_put = 10001
        const val req_camera_out_put2 = 10003
        const val req_photos_out_put = 10002
    }
}

fun Uri.toFile(context: Context): File? =
    when (scheme) {
        ContentResolver.SCHEME_FILE -> toFile()
        ContentResolver.SCHEME_CONTENT -> {
            val cursor =context.contentResolver.query(this,null,null,null,null)
            val file =cursor?.let {
                if(it.moveToFirst()){
                    if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q){
                        val openIns=context.contentResolver.openInputStream(this)
                        val displayName = it.getString(it.getColumnIndex(OpenableColumns.DISPLAY_NAME))
                        openIns?.let {
                            val file =File(context.externalCacheDir!!.absolutePath,"${Random.nextInt(0,9999)}$displayName")
                            val fos =FileOutputStream(file)
                            android.os.FileUtils.copy(openIns,fos)
                            fos.close()
                            it.close()
                            file
                        }
                    }else{
                        File(it.getString(it.getColumnIndex(MediaStore.Images.Media.DATA)))
                    }

                }else{
                    null
                }
            }
            cursor?.close()
            file
        }
        else->
            null
    }