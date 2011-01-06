#encoding: UTF-8
class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
    	t.string :name
      t.string :login
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.boolean :enabled, :default => 0
      t.boolean :can_login, :default => 0

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    
    # create guest user for system use and annonymous navigation
    guest = User.create! do |u|
      u.name = 'Visitante'
      u.login = 'guest'
      u.email = 'guest@medicalcenter.com'
      u.password = 'L0g1n_D3s@b1l1t@d0'
      u.password_confirmation = 'L0g1n_D3s@b1l1t@d0'
      u.enabled = true
      u.can_login = false
    end

    # the guest user needs to have id = 0
    sql = "UPDATE users SET id = 0"
    ActiveRecord::Base.connection.execute(sql)
    
    # reset auto increment value to create users with id starting in 1
    sql = "ALTER TABLE users AUTO_INCREMENT = 0"
    ActiveRecord::Base.connection.execute(sql)
    
    # create devel user. it must have id = 1. this is a super administrator.
    admin = User.create! do |u|
      u.id = 1
      u.name = 'Desenvolvedor Super Administrador'
      u.login = 'devel'
      u.email = 'devel@medicalcenter.com'
      u.password = 'devel123'
      u.password_confirmation = 'devel123'
      u.enabled = true
      u.can_login = true
    end
    
    # create administração user. it must have id = 2. this is a super administrator.
    admin = User.create! do |u|
      u.id = 2
      u.name = 'Administrativo'
      u.login = 'administrativo'
      u.email = 'administrativo@medicalcenter.com'
      u.password = 'administrativo123'
      u.password_confirmation = 'administrativo123'
      u.enabled = true
      u.can_login = true
    end
    
    # create médico user. it must have id = 3. this is a super administrator.
    admin = User.create! do |u|
      u.id = 3
      u.name = 'Médico'
      u.login = 'medico'
      u.email = 'medico@medicalcenter.com'
      u.password = 'medico123'
      u.password_confirmation = 'medico123'
      u.enabled = true
      u.can_login = true
    end
    
    # create enfermagem user. it must have id = 4. this is a super administrator.
    admin = User.create! do |u|
      u.id = 4
      u.name = 'Enfermagem'
      u.login = 'enfermagem'
      u.email = 'enfermagem@medicalcenter.com'
      u.password = 'enfermagem123'
      u.password_confirmation = 'enfermagem123'
      u.enabled = true
      u.can_login = true
    end
    
    # create paciente user. it must have id = 5. this is a super administrator.
    admin = User.create! do |u|
      u.id = 5
      u.name = 'Paciente'
      u.login = 'paciente'
      u.email = 'paciente@medicalcenter.com'
      u.password = 'paciente123'
      u.password_confirmation = 'paciente123'
      u.enabled = true
      u.can_login = true
    end
    
    
    
  end

  def self.down
    drop_table :users
  end
end
