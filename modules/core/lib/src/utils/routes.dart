enum Routes {
  home(caminho: "/home"),
  confirmaValidaSenha(caminho: "/confirmavalidasenha"),
  acessoNegado(caminho: '/acessoNegado'),
  paginaNaoEncontrada(caminho: '/404');

  final String caminho;
  const Routes({required this.caminho});
}
