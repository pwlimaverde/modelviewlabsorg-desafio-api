enum Routes {
  initial(caminho: "/"),
  confirmaValidaSenha(caminho: "/confirmavalidasenha");

  final String caminho;
  const Routes({required this.caminho});
}
