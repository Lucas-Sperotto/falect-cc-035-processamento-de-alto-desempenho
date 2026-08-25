# FALECT-CC-035 — Processamento de Alto Desempenho

Repositório da disciplina **Processamento de Alto Desempenho** do Bacharelado em Ciência da Computação da UNEMAT — Campus Universitário de Alto Araguaia.

**Professor:** [Prof. Me. Lucas Kriesel Sperotto](https://github.com/Lucas-Sperotto)

Este repositório reúne orientações, materiais, exemplos e atividades da disciplina. Datas, prazos e notas publicados no SIGAA prevalecem quando houver divergência.

## Comece aqui

- [Plano da disciplina](PLANO_DISCIPLINA.md)
- [Cronograma por encontro](CRONOGRAMA.md)
- [Avaliação](AVALIACAO.md)
- [Política de GitHub](POLITICA_GITHUB.md)
- [Política de uso de IA](POLITICA_IA.md)
- [EAD 01 — preparação do ambiente](ead/EAD_01_PREPARACAO_AMBIENTE_DESENVOLVIMENTO.md)

## Ambiente de trabalho

As práticas usam principalmente:

- Linux nativo ou Ubuntu no WSL 2;
- Visual Studio Code;
- Git e GitHub;
- C/C++, OpenMP, MPI e CUDA;
- ferramentas de compilação, depuração e medição de desempenho.

Siga o roteiro da EAD 01 antes de instalar ferramentas adicionais. CUDA depende de hardware e infraestrutura compatíveis; as alternativas para quem não dispõe de GPU NVIDIA serão indicadas pelo professor.

## Faça um único fork

Cada estudante deve criar **um fork deste repositório** e usá-lo durante a disciplina.

Na EAD 01, apenas prepare o ambiente e envie o diagnóstico pelo sistema acadêmico. O fluxo de fork começa quando for solicitado na atividade seguinte.

1. Clique em **Fork** na página do repositório.
2. Clone o seu fork, substituindo `SEU-USUARIO`:

   ```bash
   git clone https://github.com/SEU-USUARIO/falect-cc-035-processamento-de-alto-desempenho.git
   cd falect-cc-035-processamento-de-alto-desempenho
   ```

3. Cadastre o repositório da disciplina como `upstream`:

   ```bash
   git remote add upstream https://github.com/Lucas-Sperotto/falect-cc-035-processamento-de-alto-desempenho.git
   git remote -v
   ```

4. Mantenha a sua `main` sincronizada e faça cada atividade em uma branch própria:

   ```bash
   git switch main
   git fetch upstream
   git merge --ff-only upstream/main
   git push origin main
   git switch -c atividade/nome-da-atividade
   ```

Consulte a [política de GitHub](POLITICA_GITHUB.md) antes da primeira entrega. Não desenvolva diretamente na `main` e não reescreva o histórico de uma atividade já enviada.

## Organização

- [`aulas/`](aulas/): materiais dos encontros;
- [`ead/`](ead/): atividades e materiais da carga a distância;
- [`atividades/`](atividades/): enunciados e arquivos iniciais;
- [`exemplos/`](exemplos/): códigos demonstrativos;
- [`rubricas/`](rubricas/): critérios específicos de avaliação;
- [`templates/`](templates/): modelos de documentação e entrega.

## Privacidade e segurança

Este repositório e os forks podem ser públicos. Não versione:

- matrícula, documentos, e-mail pessoal ou outros dados pessoais;
- diagnósticos da máquina e relatórios destinados ao SIGAA;
- senhas, tokens, chaves ou arquivos `.env`;
- executáveis, arquivos de compilação ou resultados não solicitados.

O [`.gitignore`](.gitignore) cobre os artefatos locais mais comuns, mas cada estudante continua responsável por revisar `git status` antes de um commit.

## Dúvidas

Leia primeiro o [FAQ](FAQ.md) e o enunciado da atividade. Ao pedir ajuda, informe o objetivo, o comando executado, a mensagem de erro completa e o que já tentou, removendo antes qualquer dado pessoal.
