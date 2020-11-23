package com.ds.worldfunclub.responsebean;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.SerializedName;

import java.util.List;

import static com.ds.worldfunclub.app.RouteRecordKt.lastCategory;

public class HomeCategory  extends  BaseResponse{


    /**
     * category_id : 10022
     * name : 彩妆护肤
     * parent_id : 0
     * category_type : 1
     * image_id : 10003
     * sort : 100
     * create_time : 2020-10-16 14:07:43
     * image : {"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}
     * child : [{"category_id":"10024","name":"裤子","parent_id":"10022","category_type":"1","image_id":"10003","sort":"100","create_time":"2020-10-16 14:08:01","image":{"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"},"child":[{"category_id":"10027","name":"短裤","parent_id":"10024","category_type":"1","image_id":"10003","sort":"100","create_time":"2020-10-16 14:08:27","image":{"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}},{"category_id":"10034","name":"九分裤","parent_id":"10024","category_type":"1","image_id":"10003","sort":"100","create_time":"2020-10-16 15:14:01","image":{"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}}]},{"category_id":"10035","name":"上衣","parent_id":"10022","category_type":"1","image_id":"10003","sort":"100","create_time":"2020-10-16 15:17:05","image":{"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"},"child":[{"category_id":"10044","name":"毛衣","parent_id":"10035","category_type":"1","image_id":"10003","sort":"100","create_time":"2020-10-17 14:12:16","image":{"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}}]}]
     */

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean implements  Parcelable {
        private String category_id;
        private String name;
        private String parent_id;
        private String category_type;
        private String image_id;
        private String sort;
        private String create_time;
        /**
         * file_id : 10003
         * storage : qiniu
         * group_id : 0
         * file_url : http://storage.tule-live.com
         * file_name : 20201016191749d186d0949.jpg
         * file_size : 26385
         * file_type : image
         * extension : jpg
         * is_user : 0
         * is_recycle : 0
         * is_delete : 0
         * file_path : http://storage.tule-live.com/20201016191749d186d0949.jpg
         */

        private ImageBean image;
        /**
         * category_id : 10024
         * name : 裤子
         * parent_id : 10022
         * category_type : 1
         * image_id : 10003
         * sort : 100
         * create_time : 2020-10-16 14:08:01
         * image : {"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}
         * child : [{"category_id":"10027","name":"短裤","parent_id":"10024","category_type":"1","image_id":"10003","sort":"100","create_time":"2020-10-16 14:08:27","image":{"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}},{"category_id":"10034","name":"九分裤","parent_id":"10024","category_type":"1","image_id":"10003","sort":"100","create_time":"2020-10-16 15:14:01","image":{"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}}]
         */

        private List<ChildBean> child;

        public DataBean(){}
        protected DataBean(Parcel in) {
            category_id = in.readString();
            name = in.readString();
            parent_id = in.readString();
            category_type = in.readString();
            image_id = in.readString();
            sort = in.readString();
            create_time = in.readString();
            image = in.readParcelable(ImageBean.class.getClassLoader());
            child = in.createTypedArrayList(ChildBean.CREATOR);
        }

        public static final Creator<DataBean> CREATOR = new Creator<DataBean>() {
            @Override
            public DataBean createFromParcel(Parcel in) {
                return new DataBean(in);
            }

            @Override
            public DataBean[] newArray(int size) {
                return new DataBean[size];
            }
        };

        public String getCategory_id() {
            return category_id;
        }

        public void setCategory_id(String category_id) {
            this.category_id = category_id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getParent_id() {
            return parent_id;
        }

        public void setParent_id(String parent_id) {
            this.parent_id = parent_id;
        }

        public String getCategory_type() {
            return category_type;
        }

        public void setCategory_type(String category_type) {
            this.category_type = category_type;
        }

        public String getImage_id() {
            return image_id;
        }

        public void setImage_id(String image_id) {
            this.image_id = image_id;
        }

        public String getSort() {
            return sort;
        }

        public void setSort(String sort) {
            this.sort = sort;
        }

        public String getCreate_time() {
            return create_time;
        }

        public void setCreate_time(String create_time) {
            this.create_time = create_time;
        }

        public ImageBean getImage() {
            return image;
        }

        public void setImage(ImageBean image) {
            this.image = image;
        }

        public List<ChildBean> getChild() {
            return child;
        }

        public void setChild(List<ChildBean> child) {
            this.child = child;
        }

        @Override
        public int describeContents() {
            return 0;
        }

        @Override
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(category_id);
            dest.writeString(name);
            dest.writeString(parent_id);
            dest.writeString(category_type);
            dest.writeString(image_id);
            dest.writeString(sort);
            dest.writeString(create_time);
            dest.writeParcelable(image, flags);
            dest.writeTypedList(child);
        }

        public static class ImageBean implements Parcelable {
            private String file_id;
            private String storage;
            private String group_id;
            private String file_url;
            private String file_name;
            private String file_size;
            private String file_type;
            private String extension;
            private String is_user;
            private String is_recycle;
            private String is_delete;
            private String file_path;

            public ImageBean(){}

            protected ImageBean(Parcel in) {
                file_id = in.readString();
                storage = in.readString();
                group_id = in.readString();
                file_url = in.readString();
                file_name = in.readString();
                file_size = in.readString();
                file_type = in.readString();
                extension = in.readString();
                is_user = in.readString();
                is_recycle = in.readString();
                is_delete = in.readString();
                file_path = in.readString();
            }

            public static final Creator<ImageBean> CREATOR = new Creator<ImageBean>() {
                @Override
                public ImageBean createFromParcel(Parcel in) {
                    return new ImageBean(in);
                }

                @Override
                public ImageBean[] newArray(int size) {
                    return new ImageBean[size];
                }
            };

            public String getFile_id() {
                return file_id;
            }

            public void setFile_id(String file_id) {
                this.file_id = file_id;
            }

            public String getStorage() {
                return storage;
            }

            public void setStorage(String storage) {
                this.storage = storage;
            }

            public String getGroup_id() {
                return group_id;
            }

            public void setGroup_id(String group_id) {
                this.group_id = group_id;
            }

            public String getFile_url() {
                return file_url;
            }

            public void setFile_url(String file_url) {
                this.file_url = file_url;
            }

            public String getFile_name() {
                return file_name;
            }

            public void setFile_name(String file_name) {
                this.file_name = file_name;
            }

            public String getFile_size() {
                return file_size;
            }

            public void setFile_size(String file_size) {
                this.file_size = file_size;
            }

            public String getFile_type() {
                return file_type;
            }

            public void setFile_type(String file_type) {
                this.file_type = file_type;
            }

            public String getExtension() {
                return extension;
            }

            public void setExtension(String extension) {
                this.extension = extension;
            }

            public String getIs_user() {
                return is_user;
            }

            public void setIs_user(String is_user) {
                this.is_user = is_user;
            }

            public String getIs_recycle() {
                return is_recycle;
            }

            public void setIs_recycle(String is_recycle) {
                this.is_recycle = is_recycle;
            }

            public String getIs_delete() {
                return is_delete;
            }

            public void setIs_delete(String is_delete) {
                this.is_delete = is_delete;
            }

            public String getFile_path() {
                return file_path;
            }

            public void setFile_path(String file_path) {
                this.file_path = file_path;
            }

            @Override
            public int describeContents() {
                return 0;
            }

            @Override
            public void writeToParcel(Parcel dest, int flags) {
                dest.writeString(file_id);
                dest.writeString(storage);
                dest.writeString(group_id);
                dest.writeString(file_url);
                dest.writeString(file_name);
                dest.writeString(file_size);
                dest.writeString(file_type);
                dest.writeString(extension);
                dest.writeString(is_user);
                dest.writeString(is_recycle);
                dest.writeString(is_delete);
                dest.writeString(file_path);
            }
        }

        public static class ChildBean  implements Parcelable {
            private int res;
            private int type=1 ;
            private String entryUrl=lastCategory;

            public ChildBean(){}

            protected ChildBean(Parcel in) {
                res = in.readInt();
                type = in.readInt();
                entryUrl = in.readString();
                category_id = in.readString();
                name = in.readString();
                parent_id = in.readString();
                category_type = in.readString();
                image_id = in.readString();
                sort = in.readString();
                create_time = in.readString();
                childx = in.createTypedArrayList(ChildBean.CREATOR);
            }

            public static final Creator<ChildBean> CREATOR = new Creator<ChildBean>() {
                @Override
                public ChildBean createFromParcel(Parcel in) {
                    return new ChildBean(in);
                }

                @Override
                public ChildBean[] newArray(int size) {
                    return new ChildBean[size];
                }
            };

            public String getEntryUrl() {
                return entryUrl;
            }

            public void setEntryUrl(String entryUrl) {
                this.entryUrl = entryUrl;
            }

            public int getRes() {
                return res;
            }

            public void setRes(int res) {
                this.res = res;
            }

            public int getType() {
                return type;
            }

            public void setType(int type) {
                this.type = type;
            }

            private String category_id;
            private String name;
            private String parent_id;
            private String category_type;
            private String image_id;
            private String sort;
            private String create_time;

            private boolean internal=true;
            private String activity_id;
            private String activity_sign;

            public String getActivity_id() {
                return activity_id;
            }

            public String getActivity_sign() {
                return activity_sign;
            }

            public boolean isInternal() {
                return internal;
            }

            public void setInternal(boolean internal) {
                this.internal = internal;
            }

            public void setActivity_id(String activity_id) {
                this.activity_id = activity_id;
            }

            public void setActivity_sign(String activity_sign) {
                this.activity_sign = activity_sign;
            }

            /**
             * file_id : 10003
             * storage : qiniu
             * group_id : 0
             * file_url : http://storage.tule-live.com
             * file_name : 20201016191749d186d0949.jpg
             * file_size : 26385
             * file_type : image
             * extension : jpg
             * is_user : 0
             * is_recycle : 0
             * is_delete : 0
             * file_path : http://storage.tule-live.com/20201016191749d186d0949.jpg
             */

            private ImageBean image;
            /**
             * category_id : 10027
             * name : 短裤
             * parent_id : 10024
             * category_type : 1
             * image_id : 10003
             * sort : 100
             * create_time : 2020-10-16 14:08:27
             * image : {"file_id":"10003","storage":"qiniu","group_id":"0","file_url":"http://storage.tule-live.com","file_name":"20201016191749d186d0949.jpg","file_size":"26385","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}
             */

            @SerializedName("child")
            private List<ChildBean> childx;

            public String getCategory_id() {
                return category_id;
            }

            public void setCategory_id(String category_id) {
                this.category_id = category_id;
            }

            public String getName() {
                return name;
            }

            public void setName(String name) {
                this.name = name;
            }

            public String getParent_id() {
                return parent_id;
            }

            public void setParent_id(String parent_id) {
                this.parent_id = parent_id;
            }

            public String getCategory_type() {
                return category_type;
            }

            public void setCategory_type(String category_type) {
                this.category_type = category_type;
            }

            public String getImage_id() {
                return image_id;
            }

            public void setImage_id(String image_id) {
                this.image_id = image_id;
            }

            public String getSort() {
                return sort;
            }

            public void setSort(String sort) {
                this.sort = sort;
            }

            public String getCreate_time() {
                return create_time;
            }

            public void setCreate_time(String create_time) {
                this.create_time = create_time;
            }

            public ImageBean getImage() {
                return image;
            }

            public void setImage(ImageBean image) {
                this.image = image;
            }

            public List<ChildBean> getChildx() {
                return childx;
            }

            public void setChildx(List<ChildBean> childx) {
                this.childx = childx;
            }

            @Override
            public int describeContents() {
                return 0;
            }

            @Override
            public void writeToParcel(Parcel dest, int flags) {
                dest.writeInt(res);
                dest.writeInt(type);
                dest.writeString(entryUrl);
                dest.writeString(category_id);
                dest.writeString(name);
                dest.writeString(parent_id);
                dest.writeString(category_type);
                dest.writeString(image_id);
                dest.writeString(sort);
                dest.writeString(create_time);
                dest.writeTypedList(childx);
            }

            public static class ImageBean {
                private String file_id;
                private String storage;
                private String group_id;
                private String file_url;
                private String file_name;
                private String file_size;
                private String file_type;
                private String extension;
                private String is_user;
                private String is_recycle;
                private String is_delete;
                private String file_path;

                public String getFile_id() {
                    return file_id;
                }

                public void setFile_id(String file_id) {
                    this.file_id = file_id;
                }

                public String getStorage() {
                    return storage;
                }

                public void setStorage(String storage) {
                    this.storage = storage;
                }

                public String getGroup_id() {
                    return group_id;
                }

                public void setGroup_id(String group_id) {
                    this.group_id = group_id;
                }

                public String getFile_url() {
                    return file_url;
                }

                public void setFile_url(String file_url) {
                    this.file_url = file_url;
                }

                public String getFile_name() {
                    return file_name;
                }

                public void setFile_name(String file_name) {
                    this.file_name = file_name;
                }

                public String getFile_size() {
                    return file_size;
                }

                public void setFile_size(String file_size) {
                    this.file_size = file_size;
                }

                public String getFile_type() {
                    return file_type;
                }

                public void setFile_type(String file_type) {
                    this.file_type = file_type;
                }

                public String getExtension() {
                    return extension;
                }

                public void setExtension(String extension) {
                    this.extension = extension;
                }

                public String getIs_user() {
                    return is_user;
                }

                public void setIs_user(String is_user) {
                    this.is_user = is_user;
                }

                public String getIs_recycle() {
                    return is_recycle;
                }

                public void setIs_recycle(String is_recycle) {
                    this.is_recycle = is_recycle;
                }

                public String getIs_delete() {
                    return is_delete;
                }

                public void setIs_delete(String is_delete) {
                    this.is_delete = is_delete;
                }

                public String getFile_path() {
                    return file_path;
                }

                public void setFile_path(String file_path) {
                    this.file_path = file_path;
                }
            }
        }
    }
}
