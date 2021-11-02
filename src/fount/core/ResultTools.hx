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

    public static function mapOk<T, E, R>(result: Result<T, E>, op: T -> R): Result<R, E> {
        return switch result {
            case Ok(okValue): Ok(op(okValue));
            case Err(errValue): Err(errValue);
        }
    }

    public static function mapErr<T, E, F>(res: Result<T, E>, op: E -> F): Result<T, F> {
        return switch res {
            case Ok(okValue): Ok(okValue);
            case Err(errValue): Err(op(errValue));
        }
    }

    public static function map<T, R, E, F>(res: Result<T, E>, onOk: T -> R, onErr: E -> F): Result<R, F> {
        return switch res {
            case Ok(okValue): Ok(onOk(okValue));
            case Err(errValue): Err(onErr(errValue));
        }
    }

    public static function then<T, E, R>(res: Result<T, E>, op: T -> Result<R, E>): Result<R, E> {
        return switch res {
            case Ok(okValue): op(okValue);
            case Err(errValue): Err(errValue);
        }
    }

    public static function pipe<T, R, E, F>(res: Result<T, E>, op: T -> Result<R, E>, onErr: E -> F): Result<R, F> {
        return switch res {
            case Ok(val): switch op(val) {
                    case Ok(val): Ok(val);
                    case Err(val): Err(onErr(val));
                }
            case Err(val): Err(onErr(val));
        }
    }
}
