class CreateSpecialties < ActiveRecord::Migration
  def self.up
    create_table :specialties do |t|
    	t.string :name

      t.timestamps
    end
    Specialty.create(:id => 1, :name => 'Acupuntura')
    Specialty.create(:id => 2, :name => 'Administração em Saúde')
    Specialty.create(:id => 3, :name => 'Alergia e Imunologia')
    Specialty.create(:id => 4, :name => 'Alergia e Imunologia Pediátrica')
    Specialty.create(:id => 5, :name => 'Anestesiologia')
    Specialty.create(:id => 6, :name => 'Angiologia')
    Specialty.create(:id => 7, :name => 'Angiorradiologia e Cirurgia Endovascular')
    Specialty.create(:id => 8, :name => 'Atendimento ao Queimado')
    Specialty.create(:id => 9, :name => 'Cancerologia')
    Specialty.create(:id => 10, :name => 'Cancerologia Pediátrica')
    Specialty.create(:id => 11, :name => 'Cancerologia/Cancerologia Cirúrgica')
    Specialty.create(:id => 12, :name => 'CancerologiaCancerologia Clínica')
    Specialty.create(:id => 13, :name => 'Cardiologia')
    Specialty.create(:id => 14, :name => 'Cardiologia Pediátrica')
    Specialty.create(:id => 15, :name => 'Cirurgia Cardiovascular')
    Specialty.create(:id => 16, :name => 'Cirurgia Crânio-Maxilo-Facial')
    Specialty.create(:id => 17, :name => 'Cirurgia da Coluna')
    Specialty.create(:id => 18, :name => 'Cirurgia da Mão')
    Specialty.create(:id => 19, :name => 'Cirurgia da Videolaparoscópica')
    Specialty.create(:id => 20, :name => 'Cirurgia de Cabeça e Pescoço')
    Specialty.create(:id => 21, :name => 'Cirurgia de Transplante de Órgãos')
    Specialty.create(:id => 22, :name => 'Cirurgia Dermatológica')
    Specialty.create(:id => 23, :name => 'Cirurgia do Aparelho Digestivo')
    Specialty.create(:id => 24, :name => 'Cirurgia do Trauma')
    Specialty.create(:id => 25, :name => 'Cirurgia Geral')
    Specialty.create(:id => 26, :name => 'Cirurgia Pediátrica')
    Specialty.create(:id => 27, :name => 'Cirurgia Plástica')
    Specialty.create(:id => 28, :name => 'Cirurgia Torácica')
    Specialty.create(:id => 29, :name => 'Cirurgia Vascular')
    Specialty.create(:id => 30, :name => 'Citopatologia')
    Specialty.create(:id => 31, :name => 'Clínica Médica')
    Specialty.create(:id => 32, :name => 'Coloproctologia')
    Specialty.create(:id => 33, :name => 'Cosmiatria')
    Specialty.create(:id => 34, :name => 'Densitometria Óssea')
    Specialty.create(:id => 35, :name => 'Dermatologia')
    Specialty.create(:id => 36, :name => 'Diagnóstico por Imagem')
    Specialty.create(:id => 37, :name => 'Dor')
    Specialty.create(:id => 38, :name => 'Ecocardiografia')
    Specialty.create(:id => 39, :name => 'Ecografia Vascular com Doppler')
    Specialty.create(:id => 40, :name => 'Eletrofisiologia Clínica Invasiva ')
    Specialty.create(:id => 41, :name => 'Endocrinologia e Metabologia')
    Specialty.create(:id => 42, :name => 'Endocrinologia Pediátrica')
    Specialty.create(:id => 43, :name => 'Endoscopia Digestiva')
    Specialty.create(:id => 44, :name => 'Endoscopia Gastroenterologia')
    Specialty.create(:id => 45, :name => 'Endoscopia Ginecológica')
    Specialty.create(:id => 46, :name => 'Endoscopia Respiratória')
    Specialty.create(:id => 47, :name => 'Ergometria')
    Specialty.create(:id => 48, :name => 'Foniatria')
    Specialty.create(:id => 49, :name => 'Gastroenterologia Pediátrica')
    Specialty.create(:id => 50, :name => 'Genética Médica')
    Specialty.create(:id => 51, :name => 'Geriatria')
    Specialty.create(:id => 52, :name => 'Ginecologia e Obstetrícia')
    Specialty.create(:id => 53, :name => 'Hansenologia')
    Specialty.create(:id => 54, :name => 'Hematologia e Hemoterapia')
    Specialty.create(:id => 55, :name => 'Hematologia e Hemoterapia Pediátrica')
    Specialty.create(:id => 56, :name => 'Hemodinâmica e Cardiologia Intervencionista')
    Specialty.create(:id => 57, :name => 'Hepatologia')
    Specialty.create(:id => 58, :name => 'Homeopatia')
    Specialty.create(:id => 59, :name => 'Infectologia')
    Specialty.create(:id => 60, :name => 'Infectologia Hospitalar')
    Specialty.create(:id => 61, :name => 'Infectologia Pediátrica')
    Specialty.create(:id => 62, :name => 'Intradermoterapia')
    Specialty.create(:id => 63, :name => 'Mamografia')
    Specialty.create(:id => 64, :name => 'Mastologia')
    Specialty.create(:id => 65, :name => 'Medicina Antienvelhecimento')
    Specialty.create(:id => 66, :name => 'Medicina de Família e Comunidade')
    Specialty.create(:id => 67, :name => 'Medicina de Urgência')
    Specialty.create(:id => 68, :name => 'Medicina do Adolescente')
    Specialty.create(:id => 69, :name => 'Medicina do Trabalho')
    Specialty.create(:id => 70, :name => 'Medicina do Tráfego')
    Specialty.create(:id => 71, :name => 'Medicina Esportiva')
    Specialty.create(:id => 72, :name => 'Medicina Estética')
    Specialty.create(:id => 73, :name => 'Medicina Fetal')
    Specialty.create(:id => 74, :name => 'Medicina Física e Reabilitação')
    Specialty.create(:id => 75, :name => 'Medicina Intensiva')
    Specialty.create(:id => 76, :name => 'Medicina Intensiva Pediátrica')
    Specialty.create(:id => 77, :name => 'Medicina Laboratorial')
    Specialty.create(:id => 78, :name => 'Medicina Legal')
    Specialty.create(:id => 79, :name => 'Medicina Nuclear')
    Specialty.create(:id => 80, :name => 'Medicina Ortomolecular')
    Specialty.create(:id => 81, :name => 'Medicina Preventiva e Socia')
    Specialty.create(:id => 82, :name => 'Medicina Regenerativa')
    Specialty.create(:id => 83, :name => 'Nefrologia')
    Specialty.create(:id => 84, :name => 'Nefrologia Pediátrica')
    Specialty.create(:id => 85, :name => 'Neonatologia')
    Specialty.create(:id => 86, :name => 'Neurocirurgia')
    Specialty.create(:id => 87, :name => 'Neurofisiologia Clínica')
    Specialty.create(:id => 88, :name => 'Neurologia')
    Specialty.create(:id => 89, :name => 'Neurologia Pediátrica')
    Specialty.create(:id => 90, :name => 'Neurorradiologia')
    Specialty.create(:id => 91, :name => 'utrição Parenteral e Enteral')
    Specialty.create(:id => 92, :name => 'Nutrição Parenteral e Enteral Pediátrica')
    Specialty.create(:id => 93, :name => 'Nutrologia')
    Specialty.create(:id => 94, :name => 'Nutrologia Pediátrica')
    Specialty.create(:id => 95, :name => 'Oftalmologia')
    Specialty.create(:id => 96, :name => 'Ortopedia e Traumatologia')
    Specialty.create(:id => 97, :name => 'Otorrinolaringologia')
    Specialty.create(:id => 98, :name => 'Patologia')
    Specialty.create(:id => 99, :name => 'Patologia Clinica')
    Specialty.create(:id => 100, :name => 'Pediatria')
    Specialty.create(:id => 101, :name => 'Perícias')
    Specialty.create(:id => 102, :name => 'Pneumologia')
    Specialty.create(:id => 103, :name => 'Pneumologia Pediátrica')
    Specialty.create(:id => 104, :name => 'Psicanálise')
    Specialty.create(:id => 105, :name => 'Psicogeriatria')
    Specialty.create(:id => 106, :name => 'Psicoterapia')
    Specialty.create(:id => 107, :name => 'Psiquiatria')
    Specialty.create(:id => 108, :name => 'Psiquiatria Forense')
    Specialty.create(:id => 109, :name => 'Psquiatria da Infância e Adolescência')
    Specialty.create(:id => 110, :name => 'Radiologia e Diagnóstico por Imagem')
    Specialty.create(:id => 111, :name => 'Radiologia Intervencionista e Angiorradiologia')
    Specialty.create(:id => 112, :name => 'Radioterapia')
    Specialty.create(:id => 113, :name => 'Reprodução Humana ')
    Specialty.create(:id => 114, :name => 'Reumatologia')
    Specialty.create(:id => 115, :name => 'Reumatologia Pediátrica')
    Specialty.create(:id => 116, :name => 'Sexologia')
    Specialty.create(:id => 117, :name => 'Ultra-Sonografia em Ginecologia e Obstetrícia')
    Specialty.create(:id => 118, :name => 'Ultra-sonografia Geral')
    Specialty.create(:id => 119, :name => 'Urologia')
  end

  def self.down
    drop_table :specialties
  end
end
