using System;

namespace EntityLibrary
{
    public class Entidade
    {
        public string Nome { get; set; }
        public DateTime DataNascimento { get; set; }
        public int Idade { get; set; }
        public bool Ativo { get; set; }
        public double Salario { get; set; }
        public Guid ID { get; set; }

        public Entidade(string nome, DateTime dataNascimento, bool ativo, double salario)
        {
            Nome = nome;
            DataNascimento = dataNascimento;
            Ativo = ativo;
            Salario = salario;
            ID = Guid.NewGuid();
            CalcularIdade();
        }

        private void CalcularIdade()
        {
            Idade = DateTime.Now.Year - DataNascimento.Year;
        }
    }
}
