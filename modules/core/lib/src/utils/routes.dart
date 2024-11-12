enum Routes {
  initial(caminho: "/"),
  validaSenha(caminho: "/validasenha"),
  confirmaValidaSenha(caminho: "/confirmavalidasenha");

  final String caminho;
  const Routes({required this.caminho});
}
