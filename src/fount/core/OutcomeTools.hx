package fount.core;

using tink.CoreApi;

class OutcomeTools {
    public function orThrow<D, F, E>(outcome: Outcome<D, F>, onFailure: F -> E): D {
        return switch outcome {
            case Success(v): v;
            case Failure(v): throw onFailure(v);
        }
    }
}
