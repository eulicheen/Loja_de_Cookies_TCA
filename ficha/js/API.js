const SUPABASE_URL_BASE = 'https://dlzbjomtmquobzwzzfot.supabase.co';
const AUTENTICACAO_URL = `${SUPABASE_URL_BASE}/auth/v1`
const SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_UZujLvs6Ne2v5RtDVuN_iQ_dNOghJn4';

// Cadastro
const form = document.querySelector('#form');
const email = document.querySelector('#email');
const senha = document.querySelector('#senha');
const submit = document.querySelector('#submit');

let armazenar = [];

form.addEventListener('submit', cadastro);

async function cadastro(i) {

     i.preventDefault(); //impede o navegador de recarregar a página enquanto tenta logar

    const dadosCadastro = { email: email.value, password: senha.value };
            
    try {
    const resposta = await fetch(AUTENTICACAO_URL, {
        method: 'POST',
        headers: {
        apikey: SUPABASE_PUBLISHABLE_KEY,
        'Content-Type': 'application/json',
        Prefer: 'return=representation'
        },
        body: JSON.stringify(dadosCadastro)
    }
    );

    const dados = await resposta.json();

    if (!resposta.ok) {
      throw new Error(dados.message || `Erro HTTP: ${resposta.status}`);
    }

    console.log('Conta criada:', dados);

    armazenar.push(dados[0]);
    form.reset();

    }
        
    catch (error) {
            console.error('Erro ao criar conta:', error);
        }
    }






// async function main() {
//     await cadastro();
// }


// main();




