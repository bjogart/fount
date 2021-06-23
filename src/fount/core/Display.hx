package fount.core;

// TODO add a Formattable { fn fmt(f: Formatter): Void } pattern
typedef Display = {
    function toStr(): String;
}

interface IDisplay {
    function toStr(): String;
}
