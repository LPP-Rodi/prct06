require 'spec_helper'

describe BibliotecaGem do
  before :each do
    @b_1 = BibliotecaGem::Biblioteca.new("Jacobo", "Lo peor", "1", "Planeta", "2", "11/08/2008", "1254")
    @b_2 = BibliotecaGem::Biblioteca.new(["Jacobo", "Pedro", "Luis"], "La luz", "Planeta", "1", "2/11/199", ["3232","1257"])
  end

  describe "Debe poseer los campos básicos para una Biblioteca" do
    it '# Comprobación de campos' do
      expect(@b_1).to have_attributes(:autor => "Jacobo")
      expect(@b_1).to have_attributes(:titulo => "Lo peor")
      expect(@b_1).to have_attributes(:editorial => "Planeta")
      expect(@b_1).to have_attributes(:serie => "1")
      expect(@b_1).to have_attributes(:numero_edicion => "2")
      expect(@b_1).to have_attributes(:fecha_publicacion => "11/08/2008")
      expect(@b_1).to have_attributes(:isbn => "1254")
    end
  end

  describe "Peculiaridades de los campos" do
    it '# Puede poseer más de un autor' do
      expect(@b_2.autor.count).to be >= (1)
    end
    it '# Puede no existir una serie' do
      expect(@b_2.serie).to_not be_truthy
    end
    it '# Puede no existir más de un isbn' do
      expect(@b_2.isbn.count).to be >= (1)
    end
  end

  describe "Métodos de acceso" do
    it '.get_autores' do
      expect(@b_1.get_autores).to eq("Jacobo")
    end
    it '.get_titulo' do
      expect(@b_1.get_titulo).to eq("Lo peor")
    end
    it '.get_serie' do
      expect(@b_1.get_serie).to eq("1")
    end
    it '.get_editorial' do
      expect(@b_1.get_editorial).to eq("Planeta")
    end
    it '.get_edicion' do
      expect(@b_1.get_edicion).to eq("2")
    end
    it '.get_fecha' do
      expect(@b_1.get_fecha).to eq("11/08/2008")
    end
    it '.get_isbn' do
      expect(@b_1.get_isbn).to eq("1254")
    end
    it '.formateo' do
      let = "El libro Lo peor escrito por Jacobo en su serie número 1 publicado por la editorial Planeta el 11/08/2008 en su edición número 2 tiene un isbn de 1254"
      expect(@b_1.formateo).to eq(let)
    end
  end
end
