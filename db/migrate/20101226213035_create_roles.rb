#encoding: UTF-8
class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.boolean :enabled, :default => true

      t.timestamps
    end
    add_index :roles, :name
    add_index :roles, :enabled
    
    Role.create(:id => 1, :name => 'visitante', :description => 'Usuário visitante. Qualquer um que acesse este site. Não tem acesso a nada que requer login.', :enabled => 1)
    Role.create(:id => 2, :name => 'desenvolvedor', :description => 'Desenvolvedor tem acesso total.', :enabled => 1)
    Role.create(:id => 3, :name => 'administrativo', :description => 'Administrativo tem acesso nas áreas de Financeiro, Contas a Pagar, Contas a receber, Relatórios, Consultas e Agenda', :enabled => 1)
    Role.create(:id => 4, :name => 'medico', :description => 'Médico tem acesso a Agenda', :enabled => 1)
    Role.create(:id => 5, :name => 'enfermagem', :description => 'Enfermagem tem acesso a Agenda', :enabled => 1)
    Role.create(:id => 6, :name => 'paciente', :description => 'Paciente tem acesso a Agenda e marcar Consultas', :enabled => 1)
  end

  def self.down
    drop_table :roles
  end
end
