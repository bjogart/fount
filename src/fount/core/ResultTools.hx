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
}
