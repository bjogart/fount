package fount.core;

class ResultTools {
    public static function unwrap<T, E>(result: Result<T, E>): T {
        return switch result {
            case Ok(okValue): okValue;
            case Err(errValue): throw errValue;
        }
    }

    public static function unwrapOrThrow<T, E, F>(result: Result<T, E>, onErr: E -> F): T {
        return switch result {
            case Ok(okValue): okValue;
            case Err(errValue): throw onErr(errValue);
        }
    }

    public static function map<T, E, R>(result: Result<T, E>, mapFn: T -> R): Result<R, E> {
        return switch result {
            case Ok(okValue): Ok(mapFn(okValue));
            case Err(errValue): Err(errValue);
        }
    }
}
