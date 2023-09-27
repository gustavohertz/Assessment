using System;
using System.Collections.Generic;
using System.Linq;
using EntityLibrary;

namespace BusinessLibrary
{
    public class EntidadeRepository
    {
        private List<Entidade> entidades = new List<Entidade>();

        public void IncluirEntidade(Entidade entidade)
        {
            entidades.Add(entidade);
        }

        public List<Entidade> ConsultarEntidades(string termoPesquisa)
        {
            return entidades.Where(e => e.Nome.Contains(termoPesquisa)).ToList();
        }

        public void ExcluirEntidade(Guid id)
        {
            var entidadeParaExcluir = entidades.FirstOrDefault(e => e.ID == id);
            if (entidadeParaExcluir != null)
            {
                entidades.Remove(entidadeParaExcluir);
            }
        }
    }
}
