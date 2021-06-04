package fount.base;

class ArrayTools {
    public static function getOrSet<T>(arr: Array<T>, idx: Int, defVal: () -> T): T {
        return if (arr[idx] == null) {
            final v = defVal();
            arr[idx] = v;
            v;
        } else {
            arr[idx];
        }
    }
}
