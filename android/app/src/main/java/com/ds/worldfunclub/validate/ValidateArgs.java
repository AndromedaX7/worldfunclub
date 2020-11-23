package com.ds.worldfunclub.validate;

import android.content.Context;
import android.util.Log;

import com.ds.worldfunclub.validate.annotation.Length;
import com.ds.worldfunclub.validate.annotation.LengthRange;
import com.ds.worldfunclub.validate.annotation.Min;
import com.ds.worldfunclub.validate.annotation.NotNull;
import com.ds.worldfunclub.validate.annotation.PrintMsg;
import com.ds.worldfunclub.validate.annotation.RegexValidate;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import static com.ds.worldfunclub.base.ExtensionsKt.toast;


public class ValidateArgs {
    public static boolean validate(Context context, ValidateBean object) {
        boolean result = true;
        Field[] fields = object.getClass().getDeclaredFields();
        out:
        for (Field field : fields) {
            boolean cache = field.isAccessible();
            field.setAccessible(true);
            try {
                Object content = field.get(object);
                Annotation[] annotations = field.getDeclaredAnnotations();
                boolean containAnnotation = contains(annotations, PrintMsg.class);
                for (Annotation a : annotations) {
                    if (a instanceof NotNull) {
                        if (content == null || content.toString().equals("")) {
                            result = outputInfo(((NotNull) a).msg(), context, content, field, containAnnotation);
                            break out;
                        }
                    }
                    if (a instanceof LengthRange) {

                        if (content instanceof Collection) {
                            int size = ((List) content).size();
                            if (size < ((LengthRange) a).min() || size > ((LengthRange) a).max()) {
                                result = outputInfo(((LengthRange) a).msg(), context, content, field, containAnnotation);
                                break out;
                            }

                        } else if (content instanceof String) {
                            int size = ((String) content).length();
                            if (size < ((LengthRange) a).min() || size > ((LengthRange) a).max()) {
                                result = outputInfo(((LengthRange) a).msg(), context, content, field, containAnnotation);
                                break out;
                            }
                        } else if (content instanceof Map) {
                            Map map = (Map) content;
                            int size = map.size();
                            if (size < ((LengthRange) a).min() || size > ((LengthRange) a).max()) {
                                result = outputInfo(((LengthRange) a).msg(), context, content, field, containAnnotation);
                                break out;
                            }
                        }


                    }
                    if (a instanceof RegexValidate) {
                        if (!content.toString().matches(((RegexValidate) a).reg())) {
                            result = outputInfo(((RegexValidate) a).msg(), context, content, field, containAnnotation);
                            break out;
                        }
                    }
                    if (a instanceof Length) {
                        if (((Length) a).value() != content.toString().length()) {
                            result = outputInfo(((Length) a).msg(), context, content, field, containAnnotation);
                            break out;
                        }
                    }
                    if (a instanceof Min) {
                        if (((Min) a).value() > ((Number) content).doubleValue()) {
                            result = outputInfo(((Min) a).msg(), context, content, field, containAnnotation);
                            break out;
                        }
                    }
                }
                field.setAccessible(cache);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
                result = false;
            }
        }
        return result;
    }

    private static <A extends Annotation> boolean contains(Annotation[] annotations, Class<A> aClass) {

        String ss = aClass.getName();
        for (Annotation a :
                annotations) {
            String ss2 = a.annotationType().getName();
            if (ss2.equals(ss)) {
                return true;
            }
        }
        return false;
    }

    private static boolean outputInfo(String msg, Context context, Object content, Field field,
                                      boolean containsAnnotation) {
        toast(context, msg);
        if (containsAnnotation) {
            Log.e("args validate !!", field.getName() + "   -> " + msg);
        }
        return false;
    }


}
