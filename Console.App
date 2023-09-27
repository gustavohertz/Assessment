using System;
using System.Collections.Generic;
using BusinessLibrary;
using EntityLibrary;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var entidadeRepository = new EntidadeRepository();

            while (true)
            {
                Console.WriteLine("Menu:");
                Console.WriteLine("1. Incluir Entidade");
                Console.WriteLine("2. Consultar Entidades");
                Console.WriteLine("3. Sair");
                Console.Write("Escolha uma opção: ");

                var escolha = Console.ReadLine();

                switch (escolha)
                {
                    case "1":
                        Console.Write("Nome: ");
                        var nome = Console.ReadLine();
                        Console.Write("Data de Nascimento (yyyy-MM-dd): ");
                        var dataNascimento = DateTime.Parse(Console.ReadLine());
                        Console.Write("Ativo (true/false): ");
                        var ativo = bool.Parse(Console.ReadLine());
                        Console.Write("Salário: ");
                        var salario = double.Parse(Console.ReadLine());

                        var novaEntidade = new Entidade(nome, dataNascimento, ativo, salario);
                        entidadeRepository.IncluirEntidade(novaEntidade);
                        Console.WriteLine("Entidade incluída com sucesso!");
                        break;

                    case "2":
                        Console.Write("Termo de pesquisa: ");
                        var termoPesquisa = Console.ReadLine();
                        var entidadesEncontradas = entidadeRepository.ConsultarEntidades(termoPesquisa);

                        Console.WriteLine("Entidades encontradas:");
                        for (int i = 0; i < entidadesEncontradas.Count; i++)
                        {
                            Console.WriteLine($"{i + 1}. {entidadesEncontradas[i].Nome}");
                        }

                        Console.Write("Escolha o número da entidade para ver detalhes ou 0 para sair: ");
                        var escolhaDetalhes = int.Parse(Console.ReadLine());

                        Entidade entidadeSelecionada = null; // Declare a variável aqui

                        if (escolhaDetalhes > 0 && escolhaDetalhes <= entidadesEncontradas.Count)
                        {
                            entidadeSelecionada = entidadesEncontradas[escolhaDetalhes - 1];
                            Console.WriteLine($"Detalhes da entidade {entidadeSelecionada.Nome}:");
                            Console.WriteLine($"Nome: {entidadeSelecionada.Nome}");
                            Console.WriteLine($"Data de Nascimento: {entidadeSelecionada.DataNascimento:yyyy-MM-dd}");
                            Console.WriteLine($"Idade: {entidadeSelecionada.Idade} anos");
                            Console.WriteLine($"Ativo: {entidadeSelecionada.Ativo}");
                            Console.WriteLine($"Salário: {entidadeSelecionada.Salario:C}");
                        }

                        Console.WriteLine("Gostaria de atualizar as informações? || y/n");
                        var altera = Console.ReadLine();

                        if (altera == "y" && entidadeSelecionada != null)
                        {
                            Console.Write("Nome: ");
                            entidadeSelecionada.Nome = Console.ReadLine();

                            Console.Write("Data de Nascimento (yyyy-MM-dd): ");
                            entidadeSelecionada.DataNascimento = DateTime.Parse(Console.ReadLine());

                            Console.Write("Ativo (true/false): ");
                            entidadeSelecionada.Ativo = bool.Parse(Console.ReadLine());

                            Console.Write("Salário: ");
                            entidadeSelecionada.Salario = double.Parse(Console.ReadLine());

                            Console.WriteLine("As informações foram atualizadas.");
                        }
                        else if (altera == "n")
                        {
                            Console.WriteLine("As informações não serão alteradas.");
                        }


                        Console.WriteLine("Você gostaria de deletar entidade? || y/n");
                        var delete = Console.ReadLine();
                        if (delete == "y" && entidadeSelecionada != null)
                        {
                            entidadeRepository.ExcluirEntidade(entidadeSelecionada.ID);
                            Console.WriteLine("Ok, a entidade será deletada");
                        }
                        else if (delete == "n")
                        {
                            Console.WriteLine("Ok, a entidade será mantida");
                        }

                        break;


                    case "3":
                        Console.WriteLine("Encerrando o programa.");
                        Environment.Exit(0);
                        break;

                    default:
                        Console.WriteLine("Opção inválida. Tente novamente.");
                        break;
                }
            }
        }
    }
}
