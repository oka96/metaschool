module calculator::calculator {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    struct Output has key, store {
        id : UID,
        result : u64
    }
    // public entry fun start (ctx: &mut TxContext) {
    //     let output = Output{
    //         id: object::new(ctx),
    //         result: 0,
    //     }

    //     transfer::public_transfer(output, tx_context::sender(ctx));
    // }
    public entry fun add (a: u64, b: u64, ctx: &mut TxContext){
        let output = generateOutput(a+b, ctx);
        transfer::public_transfer(output, tx_context::sender(ctx));
    }

    public entry fun sub (a: u64, b: u64, ctx: &mut TxContext){
        let output = generateOutput(a-b, ctx);
        transfer::public_transfer(output, tx_context::sender(ctx));
    }

    public entry fun mul (a: u64, b: u64, ctx: &mut TxContext){
        let output = generateOutput(a*b, ctx);
        transfer::public_transfer(output, tx_context::sender(ctx));
    }

    public entry fun div (a: u64, b: u64, ctx: &mut TxContext){
        let output = generateOutput(a/b, ctx);
        transfer::public_transfer(output, tx_context::sender(ctx));
    }

    fun generateOutput(r: u64, ctx: &mut TxContext): Output {
        Output {
            id: object::new(ctx),
            result: r
        }
    }
}