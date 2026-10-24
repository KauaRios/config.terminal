# Alacritty — Mocha

Fundo escuro, cores pastel, cursor fino, margens confortáveis e fonte Hack 12.
Compatível com Alacritty moderno (TOML); validado na versão 0.17.0.

## Instalação

Mantenha `instalar.sh`, `alacritty.toml` e `starship.toml` na mesma pasta e execute:

```sh
sh instalar.sh
```

O script copia as configurações para:

- `${XDG_CONFIG_HOME:-$HOME/.config}/alacritty/alacritty.toml`
- `${XDG_CONFIG_HOME:-$HOME/.config}/starship.toml`

Não exige sudo. Se houver uma configuração diferente, salva um backup na pasta
`backup-DATA-HORA-...` dentro da pasta de configuração antes de substituí-la.
O programa Alacritty e a fonte Hack devem estar instalados no computador destino.
A instalação do Starship e sua inicialização no `.bashrc` são feitas manualmente;
o script apenas copia os arquivos de configuração.

## Atalhos

- Ctrl+Shift+C / V: copiar / colar.
- Ctrl+Shift+N: nova janela.
- Ctrl+Shift+F: pesquisar no histórico.
- Ctrl++ / Ctrl+-: aumentar / diminuir a fonte.
- Ctrl+0: restaurar tamanho da fonte.

## Ajustes

Edite `font.size` para mudar o tamanho da fonte e `window.opacity` para ajustar a
transparência (1.0 é opaco). O desfoque depende do suporte do compositor gráfico.
Depois de editar esta cópia, execute o instalador novamente.
Para restaurar um backup, copie o `alacritty.toml` do backup para a pasta de
configuração e reabra o terminal.
