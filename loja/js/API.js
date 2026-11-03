import {SUPABASE_URL} from "./env.js";
import {SUPABASE_PUBLISHABLE_KEY} from "./env.js";

// Cadastro
async function cadastro() {

    try{
    const registro = await fetch(
        `${SUPABASE_URL}/rest/v1/usuarios?select=*`,
        {
          headers: {
            apikey: SUPABASE_PUBLISHABLE_KEY,
            Accept: 'application/json'
          }
        }
      )

      console.log(registro);
    }
    catch(erro) {
        'blabla'.textContent = `Não foi possível fazer login: ${erro.message}`
    }
}

async function main() {
    await cadastro();
}


main();