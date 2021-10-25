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

    public static function map<T, E, R>(result: Result<T, E>, op: T -> R): Result<R, E> {
        return switch result {
            case Ok(okValue): Ok(op(okValue));
            case Err(errValue): Err(errValue);
        }
    }

    public static function mapOrElse<T, R, E, F>(res: Result<T, E>, onOk: T -> R, onErr: E -> F): Result<R, F> {
        return switch res {
            case Ok(okVal): Ok(onOk(okVal));
            case Err(errVal): Err(onErr(errVal));
        }
    }
}
