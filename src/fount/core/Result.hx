package fount.core;

enum Result<T, E> {
    Ok(okValue: T);
    Err(errValue: E);
}
