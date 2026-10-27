const { createClient } = supabase;

const banco = createClient(
    config.url,
    config.publishableKey
)




// LOGIN
async function entrar() {
    const email = config.email

    const senha = config.senha

    const { data, error } =
        await banco.auth.signInWithPassword({
            email: email,
            password: senha
        });

    if (error) {
        console.log( error.message);
        return;
    }
    console.log(data.user.email);
}

async function main() {
    await entrar();
    let personagens = await buscarPersonagens();
    let item = await getItem();
    console.log(item);
    console.log(personagens);

}


main();