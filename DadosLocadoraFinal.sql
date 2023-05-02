CREATE DATABASE Dados_Locadora

CREATE TABLE LoginFunc (ID       INT           NOT NULL IDENTITY (1,1)
                       ,RAFunc   INT           NOT NULL 
					   ,cSenha   VARCHAR (20)  NOT NULL
					   ,Cargo    CHAR    (1)   NOT NULL
					   ,Constraint PK_LoginFunc primary key (id)
					   ,constraint FK_LoginFunc_Funcionario FOREIGN KEY (RAFunc) REFERENCES Funcionario(RAFunc)
					   ,CONSTRAINT CK_LoginFunc_Cargo CHECK (Cargo IN ('1','2','3'))
					   )


CREATE TABLE Funcionario(RAFunc         INT              NOT NULL IDENTITY (1,4000)
                        ,cNmNome        VARCHAR (200)    NOT NULL
						,dNascimento    VARCHAR (12)     NOT NULL
					    ,cGenero        CHAR    (1)      NOT NULL
						,Naturalidade   CHAR    (2)      NOT NULL
						,UFnasc         CHAR    (2)      NOT NULL
						,cTelefone      VARCHAR (20)         NULL
					    ,cCelular       VARCHAR (20)         NULL
						,cCep           VARCHAR (200)    NOT NULL
					    ,cEndereco      VARCHAR (200)    NOT NULL
					    ,cNumero        INT              NOT NULL
						,cComplemento   VARCHAR (200)        NULL
						,cBairro        VARCHAR (200)    NOT NULL
						,cCidade        VARCHAR (200)    NOT NULL
					    ,UFresid        CHAR    (2)      NOT NULL
						,cEmail         VARCHAR (200)        NULL
						,Estado_Civil   CHAR    (1)      NOT NULL
						,cCPF           VARCHAR (20)     NOT NULL
					    ,cRG            VARCHAR (20)     NOT NULL
						,cUfExp         CHAR    (2)      NOT NULL
						,Titulo_Eleitor VARCHAR (20)     NOT NULL
						,Secao          VARCHAR (5)      NOT NULL
						,Zona           VARCHAR (5)      NOT NULL
						,PIS            VARCHAR (20)     NOT NULL
						,Banco          CHAR    (2)      NOT NULL
						,Agencia        VARCHAR (10)     NOT NULL
						,Conta          VARCHAR (10)     NOT NULL
						,Tipo_Conta     CHAR    (1)      NOT NULL
						,DataDeInclusao DATETIME         NOT NULL
						 CONSTRAINT DF_Funcionario_DataDeInclusao DEFAULT (GETDATE())
						,CONSTRAINT PK_Funcionario PRIMARY KEY (RAFunc)
						,CONSTRAINT UK_Funcionario UNIQUE (cEmail, cCPF, cRG, Titulo_Eleitor, PIS, Agencia, Conta)
						,CONSTRAINT CK_Funcionario_cGenero CHECK (cGenero IN ('1','2','3'))
						,CONSTRAINT CK_Funcionario_UFnasc CHECK (UFnasc IN('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27'))
						,CONSTRAINT CK_Funcionario_UFresid CHECK (UFresid IN('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27'))
						,CONSTRAINT CK_Funcionario_Estado_Civil CHECK (Estado_Civil IN ('1','2','3','4'))
						,CONSTRAINT CK_Funcionario_cUfExp CHECK (cUfExp IN('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27'))
						,CONSTRAINT CK_Funcionario_Naturalidade CHECK (Naturalidade IN ('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27'))
						,CONSTRAINT CK_Funcionario_Banco CHECK (Banco IN ('1','2','3','4','5','6','7','8','9','10'))
						,CONSTRAINT CK_Funcionario_Tipo_Conta CHECK (Tipo_Conta IN ('1','2','3','4'))
                        )


CREATE TABLE Cliente (nCdCliente   DECIMAL (10,0)   NOT NULL
                     IDENTITY (1,1)
                     ,cNmNome      VARCHAR (200)    NOT NULL
					 ,dNascimento  VARCHAR (12)     NOT NULL
					 ,cGenero      CHAR    (1)      NOT NULL
					 ,cEmail       VARCHAR (200)        NULL
					 ,cTelefone    VARCHAR (20)         NULL
					 ,cCelular     VARCHAR (20)         NULL
					 ,cPessoa	   CHAR    (1)      NOT NULL
					 ,cCpf         VARCHAR (20)     NOT NULL
					 ,cRG          VARCHAR (20)     NOT NULL
					 ,cOrgExp      VARCHAR (100)    NOT NULL
					 ,cUfExp       VARCHAR (5)      NOT NULL
					 ,cCep         VARCHAR (200)    NOT NULL
					 ,cEndereco    VARCHAR (200)    NOT NULL
					 ,cNumero      INT              NOT NULL
					 ,cUF          VARCHAR (5)      NOT NULL
					 ,cBairro      VARCHAR (200)    NOT NULL
					 ,cCidade      VARCHAR (200)    NOT NULL
					 ,cComplemento VARCHAR (200)        NULL
					 ,dInclusao    DATETIME         NOT NULL
					  CONSTRAINT DF_Cliente_dInclusao DEFAULT (GETDATE())
					 ,CONSTRAINT PK_Cliente PRIMARY KEY (nCdCliente)
					 ,CONSTRAINT UK_Cliente UNIQUE (cCpf, cRG, cEmail)
					 ,CONSTRAINT CK_Cliente_cGenero CHECK (cGenero IN ('1','2','3'))
					 ,CONSTRAINT CK_Cliente_cPessoa CHECK (cPessoa IN ('1','2'))
                     )


CREATE TABLE DVD (nCdDVD          Int NOT NULL IDENTITY (1,1)
                 ,cNmNome         VARCHAR (200)  NOT NULL 
				 ,cGenero         VARCHAR (200)  NOT NULL
				 ,cClassificacao  VARCHAR (200)  NOT NULL
				 ,dInclusao       DATETIME       NOT NULL
				 CONSTRAINT DF_DVD_dInclusao DEFAULT (GETDATE())
				 ,iQtd            INT            NOT NULL
				 ,cFoto           VARBINARY (MAX)      NULL
				 ,CONSTRAINT PK_DVD PRIMARY KEY (nCdDVD)
				 ,CONSTRAINT UK_DVD UNIQUE (cNmNome)
				 ,CONSTRAINT CK_DVD_cGenero CHECK (cGenero IN ('1','2','3','4 ','5','6','7','8'))
				 )


CREATE TABLE VIDEO_GAME (nCdVideo_Game   DECIMAL (10,0) NOT NULL IDENTITY (1,1)
                        ,cNmNome         VARCHAR (200)  NOT NULL 
				        ,cGenero         VARCHAR (200)  NOT NULL
				        ,cClassificacao  VARCHAR (200)  NOT NULL
						,cPlataforma     VARCHAR (200)  NOT NULL
				        ,dInclusao       DATETIME       NOT NULL
				        CONSTRAINT DF_Video_Game_dInclusao DEFAULT (GETDATE())
				        ,iQtd            INT            NOT NULL
				        ,cFoto           VARCHAR (MAX)  NOT NULL
				        ,CONSTRAINT PK_Video_Game PRIMARY KEY (nCdVideo_Game)
				        ,CONSTRAINT UK_Video_Game UNIQUE (cNmNome)
				        )


CREATE TABLE Preco    (nCdDVD          DECIMAL (10,0) NOT NULL
                      ,nCdVideo_Game   DECIMAL (10,0) NOT NULL
                      ,dInicioVigencia DATETIME       NOT NULL
					  ,nPreco          DECIMAL (18,3) NOT NULL
					  ,CONSTRAINT PK_Preco PRIMARY KEY (nCdDVD, dInicioVigencia, nCdVideo_Game)
					  ,CONSTRAINT FK_Preco_DVD FOREIGN KEY (nCdDVD) REFERENCES DVD (nCdDVD)
					  ,CONSTRAINT FK_Preco_VideoGame FOREIGN KEY (nCdVideo_Game) REFERENCES VIDEO_GAME (nCdVideo_Game)
                      ,CONSTRAINT CK_Preco_nPreco  CHECK (nPreco >= 0)
				      )


CREATE TABLE Locacao (nCdLocacao   DECIMAL (10,0) NOT NULL IDENTITY (1,1)
                     ,nCdCliente   DECIMAL (10,0) NOT NULL 
					 ,dLocacao     DATETIME       NOT NULL
					 CONSTRAINT  DF_Locacao_dLocacao DEFAULT (GETDATE())
					 ,CONSTRAINT PK_nCdLocacao PRIMARY KEY (nCdLocacao)
					 ,CONSTRAINT FK_Locacao_Cliente FOREIGN KEY (nCdCliente) REFERENCES Cliente (nCdCliente)
					 )

CREATE TABLE ItemLocacao (nCdLocacao    DECIMAL (10,0) NOT NULL IDENTITY (1,1)
                         ,iItemLocacao  INT            NOT NULL
                         ,nCdDVD        DECIMAL (10,0)     NULL
						 ,nCdVideo_Game DECIMAL (10,0)     NULL
						 ,iQtd          INT            NOT NULL
						 ,nPreco        DECIMAL (18,3) NOT NULL
						 ,CONSTRAINT PK_ItemLocacao PRIMARY KEY (nCdLocacao, iItemLocacao)
						 ,CONSTRAINT FK_ItemLocacao_Locacao FOREIGN KEY (nCdLocacao) REFERENCES Locacao (nCdLocacao)
						 ,CONSTRAINT FK_ItemLocacao_DVD FOREIGN KEY (nCdDVD) REFERENCES DVD (nCdDVD)
						 ,CONSTRAINT FK_ItemLocacao_VIDEO_GAME FOREIGN KEY (nCdVideo_Game) REFERENCES VIDEO_GAME (nCdVideo_Game)
						 ,CONSTRAINT CK_ItemLocacao_iQtde CHECK (iQtd > 0)
						 ,CONSTRAINT CK_ItemLocacao_nPreco CHECK(nPreco >= 0)
						 )