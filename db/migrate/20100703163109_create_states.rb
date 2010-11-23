class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
    	t.string :name
    	t.string :acronym

      t.timestamps
    end
    State.create(:id => 1, :name => 'Acre', :acronym => 'AC')
    State.create(:id => 2, :name => 'Alagoas', :acronym => 'AL')
    State.create(:id => 3, :name => 'Amapá', :acronym => 'AP')
    State.create(:id => 4, :name => 'Amazonas', :acronym => 'AM')
    State.create(:id => 5, :name => 'Bahia', :acronym => 'BA')
    State.create(:id => 6, :name => 'Ceará', :acronym => 'CE')
    State.create(:id => 7, :name => 'Distrito Federal', :acronym => 'DF')
    State.create(:id => 8, :name => 'Espírito Santo', :acronym => 'ES')
    State.create(:id => 9, :name => 'Goiás', :acronym => 'GO')
    State.create(:id => 10, :name => 'Maranhão', :acronym => 'MA')
    State.create(:id => 11, :name => 'Mato Grosso', :acronym => 'MT')
    State.create(:id => 12, :name => 'Mato Grosso do Sul', :acronym => 'MS')
    State.create(:id => 13, :name => 'Minas Gerais', :acronym => 'MG')
    State.create(:id => 14, :name => 'Pará', :acronym => 'PA')
    State.create(:id => 15, :name => 'Paraíba', :acronym => 'PB')
    State.create(:id => 16, :name => 'Paraná', :acronym => 'PR')
    State.create(:id => 17, :name => 'Pernambuco', :acronym => 'PE')
    State.create(:id => 18, :name => 'Piauí', :acronym => 'PI')
    State.create(:id => 19, :name => 'Rio de Janeiro', :acronym => 'RJ')
    State.create(:id => 20, :name => 'Rio Grande do Norte', :acronym => 'RN')
    State.create(:id => 21, :name => 'Rio Grande do Sul', :acronym => 'RS')
    State.create(:id => 22, :name => 'Rondônia', :acronym => 'RO')
    State.create(:id => 23, :name => 'Rorâima', :acronym => 'RR')
    State.create(:id => 24, :name => 'São Paulo', :acronym => 'SP')
    State.create(:id => 25, :name => 'Santa Catarina', :acronym => 'SC')
    State.create(:id => 26, :name => 'Sergipe', :acronym => 'SE')
    State.create(:id => 27, :name => 'Tocantins', :acronym => 'TO')
  end

  def self.down
    drop_table :states
  end
end
