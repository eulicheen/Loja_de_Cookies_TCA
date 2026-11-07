import {SUPABASE_URL} from "./env.js";
import {SUPABASE_PUBLISHABLE_KEY} from "./env.js";

// Cadastro
const form = document.querySelector('#form');
const email = document.querySelector('#email');
const senha = document.querySelector('#senha');

let armazenar = [];

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
      );

      armazenar = await registro.json();

    }
    catch(erro) {
        email.textContent = `Algo deu errado ${erro.message}`
        senha.textContent = `Algo deu errado ${erro.message}`
    }
}


form.addEventListener('submit', updateConta);


// armazenar contas
async function updateConta(conta) {
    conta.preventDefault(); // impede o html de recarregar a página inteira
            
  const id = registroId.value;
  const infos = { 
      email: email.value,
      senha: senha.value
   };

    try {
    const url = new URL(`${SUPABASE_URL}`)
    url.searchParams.set('id', `eq.${id}`)
    const registro = await fetch(url, {
                  method: 'PATCH',
                  headers: {    
                  apikey: SUPABASE_PUBLISHABLE_KEY,
                  'Content-Type': 'application/json',  
                  Prefer:'return=representation'
          },
                  body: JSON.stringify(infos)
              });
              const updatedCadastro = await response.json();
              
              updateConta(); // Atualiza a lista de notícias após a alteração
          } catch (error) {
              console.error('Erro ao alterar notícia:', error);
          }
      }

async function main() {
    await cadastro();
}


main();