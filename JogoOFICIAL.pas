program untitled;
uses crt;
var 
linOri,linDes,colOri,colDes,c,resultado,i,j,jogador1,jogador2,a,b,comer : integer;
xadrez: array[1..8, 1..8] of char;
peca : char;
Procedure InicializaMenu;
Begin
    writeln;
    writeln;
    writeln;
    writeln;
		textcolor(white);
		writeln('                                      ************************* BEM VINDO AO JOGO DE XADREZ ****************************');
		writeln('                                      *****                            REGRAS DO JOGO:                             *****');
		writeln('                                      *****  Este jogo tem um tabuleiro em formato de uma matriz com 8 linhas e    *****');
		writeln('                                      *****  8 colunas, onde para se escolher a peca que o jogador deseja mo-      *****');
		writeln('                                      *****  vimentar, deve-se escrever a linha e a coluna de origem de onde a     *****');
		writeln('                                      *****  peca está e a linha e a coluna de destino onde a peca sera levada.    *****');
		writeln('                                      *****  Caso seja possivel comer a peca presente na linha e coluna de des-    *****');
		writeln('                                      *****  tino, sera impressa uma mensagem de aviso que de eh possivel comer    *****');
		writeln('                                      *****  a peca escolhida e jogador que realizar esse feito sera pontuado.     *****');
		writeln('                                      *****  Nesse tabuleiro, as pecas brancas sao as letras maiusculas e as le-   *****');
		writeln('                                      *****  cas minusculas sao as pecas pretas.                                   *****');
		writeln('                                      *****   Quando nao for possivel fazer os movimentos que o jogador escolher,  *****');
		writeln('                                      *****   sera impressa uma mensagem de alerta e o jogador sera novamente re-  *****');
		writeln('                                      *****   direcionado a escolher uma nova peca, de modo que a mesma possa re-  *****');
		writeln('                                      *****   alizar os movimentos corretos.                                       *****');
		writeln('                                      *****  	                       IMPORTANTE:                                 *****');
		writeln('                                      *****             Não esqueca os movimentos que cada peca pode realizar      *****');
		writeln('                                      *****   T(Torre Branca) e t(Torre Preta) podem realizar qualquer movimento   *****');
		writeln('                                      *****   na Horizontal ou na Vertical                                         *****');
		writeln('                                      *****   C(Cavalo Branco) e c(Cavalo preto) podem realizar movimento em L     *****');
		writeln('                                      *****   B(Bispo Branco) e b(Bispo Preto) podem realizar movimento em diagonal*****');
		writeln('                                      *****   Q(Rainha Branca) e q(Rainha Preta) podem realizar qualquer movimento *****');
		writeln('                                      *****   na horizontal, vertical ou nas diagonais                             *****');
		writeln('                                      *****   K(Rei Branco) e k(Rei Preto) podem realizar movimentos em formato de *****');
		writeln('                                      *****   cruz, ou seja, para frente, para trás, esquerda ou direita           *****');
		writeln('                                      *****   P(Peão Branco) e p(Peão Preto) podem realizar qualquer movimento que *****');
		writeln('                                      *****   seja para frente, andando uma ou duas casas, ou fazer apenas um movi-*****');
		writeln('                                      *****   mento na diagonal, quando for comer o seu oponente.                  *****');
		writeln('                                      *****   Quando o rei estiver prestes a ser comido, sera impressa uma mensa-  *****');
		writeln('                                      *****   de que ele esta em xeque e sera comido pelo seu oponente             *****');
		writeln('                                      *****   O JOGO SO TERMINARA QUANDO O REI FOR COMIDO. QUANDO ISSO OCORRER,    *****');
		writeln('                                      *****   SERA IMPRESSO UMA MENSAGEM DE QUEM VENCEU O JOGO E PROGRAMA SERA     *****');
		writeln('                                      *****   FINALIZADO.                                                          *****');
		writeln('                                      *****                      Tenha um excelente jogo !!!                       *****');
		writeln('                                      **********************************************************************************');
		writeln('                                      **********************************************************************************');
		writeln;
		writeln('                                                                APERTE ENTER PARA INICIAR O JOGO                        ');
		
		
End;

Procedure DesenhaTabuleiro;
Var
i,j,r : integer;
aux,temp:char;
Begin
clrscr;
		textcolor(white);
		writeln('*************PECAS BRANCAS**************');
		for i:= 1 to 8 do 
	begin
			for r:=1 to 3 do
			begin
					for j:=1 to 8 do
					begin
							temp:=xadrez[i,j];//peca
							if(((i+j) mod 2 =0)) then
							begin
									aux:=#178;//letra
							end
							else
							begin
									aux:=' ';
							end; 
							if((r=1) and (temp<>' ')) then
							begin
									aux:=temp;
							end
							else
							begin
									aux:=aux;
							end;
							if(((i+j) mod 2 =0 )) then
							begin
									textbackground(black);
									textcolor(white);
									write(#178#178,aux,#178#178); 
							end
							else
							begin
									textbackground(black);
									textcolor(white);
									write('  ',aux,'  ');  
							end		
					end;
					writeln;
			end;
	end;
	textcolor(white);
	writeln('*************PECAS PRETAS***************');
End;

Function moverPeca(linOri,colOri,linDes,colDes :integer) : integer;
Var
mover:integer;                                 
dV,dH,i,j:integer;
peca: char;
begin
		mover:= 0;
		dV := abs(linDes - linOri);
		dH := abs(colDes - colOri);
		if((linOri>=1) and (linOri<9) and (colOri>=1) and (colOri<9) and (linDes>=1) and (linDes<9) and (colDes>=1) and (colDes<9)) then
		begin
				peca:=xadrez[linOri,colOri];
				if(((peca='T') or (peca='t')) and ((dV=0) or (dH=0))) then
				begin
						if((dH = 0) and (peca = 'T')) then
						begin
								if(linOri < linDes ) then
								begin
										for i:=linOri to (linDes-1) do
										begin
												if(xadrez[i+1,colOri] = ' ') then
												begin
														mover:=1;
												end
												else
												begin
														if((xadrez[i+1,colOri] = 't') or (xadrez[i+1,colOri] = 'c') or (xadrez[i+1,colOri] = 'b') or (xadrez[i+1,colOri] = 'q') or (xadrez[i+1,colOri] = 'k') or (xadrez[i+1,colOri]= 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																mover:=0;
																moverPeca:=9;
																break;
														end
												end
												
										end
								end;
								if(linOri > linDes ) then
								begin
										for i:=linOri downto (linDes+1) do    
										begin
												if(xadrez[i-1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i-1,colOri] = 't') or (xadrez[i-1,colOri] = 'c') or (xadrez[i-1,colOri] = 'b') or (xadrez[i-1,colOri] = 'q') or (xadrez[i-1,colOri] = 'k') or (xadrez[i-1,colOri]= 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																mover:=0;
																moverPeca:=9;
																break;
														end  	
												end
										end;
								end
						end;
						if((dV = 0) and (peca = 'T')) then
						begin
								if(colOri < colDes ) then
								begin
										for i:=colOri to (colDes-1) do
										begin
												if(xadrez[linOri,i+1] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[linOri,i+1] = 't') or (xadrez[linOri,i+1] ='c') or (xadrez[linOri,i+1] = 'b') or (xadrez[linOri,i+1] ='q') or (xadrez[linOri,i+1] ='k') or (xadrez[linOri,i+1] = 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
												
										end
								end;
								if(colOri > colDes ) then
								begin
										for i:=colOri downto (colDes+1) do // enquanto colOri>colDes, i--;    
										begin
												if(xadrez[linOri,i-1] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[linOri,i-1] = 't') or (xadrez[linOri,i-1] = 'c') or (xadrez[linOri,i-1] = 'b') or (xadrez[linOri,i-1] = 'q') or (xadrez[linOri,i-1] = 'k') or (xadrez[linOri,i-1] = 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end;             
						if((dH = 0) and (peca = 't')) then
						begin
								if(linOri < linDes ) then
								begin
										for i:=linOri to (linDes-1) do
										begin
												if(xadrez[i+1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i+1,colOri] = 'T') or (xadrez[i+1,colOri] = 'C') or (xadrez[i+1,colOri] = 'B') or (xadrez[i+1,colOri] = 'Q') or (xadrez[i+1,colOri] = 'K') or (xadrez[i+1,colOri]= 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
												
										end
								end;
								if(linOri > linDes ) then
								begin
										for i:=linOri downto (linDes+1) do    
										begin
												if(xadrez[i-1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i-1,colOri] = 'T') or (xadrez[i-1,colOri] = 'C') or (xadrez[i-1,colOri] = 'B') or (xadrez[i-1,colOri] = 'Q') or (xadrez[i-1,colOri] = 'K') or (xadrez[i-1,colOri]= 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end;
						if((dV = 0) and (peca = 't')) then
						begin
								if(colOri < colDes ) then
								begin
										for i:=colOri to (colDes-1) do
										begin
												if(xadrez[linOri,i+1] = ' ') then    
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[linOri,i+1] = 'T') or (xadrez[linOri,i+1] ='C') or (xadrez[linOri,i+1] = 'B') or (xadrez[linOri,i+1] ='Q') or (xadrez[linOri,i+1] ='K') or (xadrez[linOri,i+1] = 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
												
										end
								end;
								if(colOri > colDes ) then
								begin
										for i:=colOri downto (colDes+1) do // enquanto colOri>colDes, i--;    
										begin
												if(xadrez[linOri,i-1] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[linOri,i-1] = 'T') or (xadrez[linOri,i-1] = 'C') or (xadrez[linOri,i-1] = 'B') or (xadrez[linOri,i-1] = 'Q') or (xadrez[linOri,i-1] = 'K') or (xadrez[linOri,i-1] = 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end
						//moverPeca:=1;
						//mover:=1;
				end;
				if(((peca='C') or (peca='c')) and (((dV=1) and (dH=2)) or ((dV=2) and (dH=1)))) then
				begin
						if(peca= 'C') then
						begin
								if((xadrez[linDes,colDes] = 'P') or (xadrez[linDes,colDes] = 'T') or (xadrez[linDes,colDes] = 'B') or (xadrez[linDes,colDes] = 'C') or (xadrez[linDes,colDes] = 'Q') or (xadrez[linDes,colDes] = 'K')) then
								begin
										moverPeca:=9;
										mover:=0;
								end
								else
								begin
										mover:=1;
										moverPeca:=1;
								end
						end;
						if(peca= 'c') then
						begin
								if((xadrez[linDes,colDes] = 'p') or (xadrez[linDes,colDes] = 't') or (xadrez[linDes,colDes] = 'b') or (xadrez[linDes,colDes] = 'c') or (xadrez[linDes,colDes] = 'q' )or (xadrez[linDes,colDes] = 'k')) then
								begin
										moverPeca:=9;
										mover:=0;
								end
								else
								begin
										mover:=1;
										moverPeca:=1;
								end
						end
						//moverPeca:=1;
						//mover:=1;
				end;
				if(((peca='B') or (peca='b')) and (dV=dH))then
				begin
						if(peca='B') then
						begin
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i+1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j-1]='t') or (xadrez[i+1,j-1]='c') or (xadrez[i+1,j-1]='b') or (xadrez[i+1,j-1]='q') or (xadrez[i+1,j-1]='k') or (xadrez[i+1,j-1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i-1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j-1]='t') or (xadrez[i-1,j-1]='c') or (xadrez[i-1,j-1]='b') or (xadrez[i-1,j-1]='q') or (xadrez[i-1,j-1]='k') or (xadrez[i-1,j-1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														i:=i-1;
										 		end
										 end
								end;
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i+1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j+1]='t') or (xadrez[i+1,j+1]='c') or (xadrez[i+1,j+1]='b') or (xadrez[i+1,j+1]='q') or (xadrez[i+1,j+1]='k') or (xadrez[i+1,j+1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i-1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j+1]='t') or (xadrez[i-1,j+1]='c') or (xadrez[i-1,j+1]='b') or (xadrez[i-1,j+1]='q') or (xadrez[i-1,j+1]='k') or (xadrez[i-1,j+1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i-1;
										 		end
										 end
								end
						end;
						if(peca='b') then
						begin
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i+1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j-1]='T') or (xadrez[i+1,j-1]='C') or (xadrez[i+1,j-1]='B') or (xadrez[i+1,j-1]='Q') or (xadrez[i+1,j-1]='K') or (xadrez[i+1,j-1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i-1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j-1]='T') or (xadrez[i-1,j-1]='C') or (xadrez[i-1,j-1]='B') or (xadrez[i-1,j-1]='Q') or (xadrez[i-1,j-1]='K') or (xadrez[i-1,j-1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														i:=i-1;
										 		end
										 end
								end;
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i+1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j+1]='T') or (xadrez[i+1,j+1]='C') or (xadrez[i+1,j+1]='B') or (xadrez[i+1,j+1]='Q') or (xadrez[i+1,j+1]='K') or (xadrez[i+1,j+1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i-1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j+1]='T') or (xadrez[i-1,j+1]='C') or (xadrez[i-1,j+1]='B') or (xadrez[i-1,j+1]='Q') or (xadrez[i-1,j+1]='K') or (xadrez[i-1,j+1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i-1;
										 		end
										 end
								end
						end
						//moverPeca:=1;
						//mover:=1;
				end;
				if(((peca='Q') or (peca='q')) and ((dV=dH) or (dV=0) or (dH=0)))then
				begin
						if((dH = 0) and (peca = 'Q')) then
						begin
								if(linOri < linDes ) then
								begin
										for i:=linOri to (linDes-1) do
										begin
												if(xadrez[i+1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i+1,colOri] = 't') or (xadrez[i+1,colOri] = 'c') or (xadrez[i+1,colOri] = 'b') or (xadrez[i+1,colOri] = 'q') or (xadrez[i+1,colOri] = 'k') or (xadrez[i+1,colOri]= 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
												
										end
								end;
								if(linOri > linDes ) then
								begin
										for i:=linOri downto (linDes+1) do    
										begin
												if(xadrez[i-1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i-1,colOri] = 't') or (xadrez[i-1,colOri] = 'c') or (xadrez[i-1,colOri] = 'b') or (xadrez[i-1,colOri] = 'q') or (xadrez[i-1,colOri] = 'k') or (xadrez[i-1,colOri]= 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end;
						if((dV = 0) and (peca = 'Q')) then
						begin
								if(colOri < colDes ) then
								begin
										for i:=colOri to (colDes-1) do
										begin
												if(xadrez[linOri,i+1] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[linOri,i+1] = 't') or (xadrez[linOri,i+1] ='c') or (xadrez[linOri,i+1] = 'b') or (xadrez[linOri,i+1] ='q') or (xadrez[linOri,i+1] ='k') or (xadrez[linOri,i+1] = 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
												
										end
								end;
								if(colOri > colDes ) then
								begin
										for i:=colOri downto (colDes+1) do // enquanto colOri>colDes, i--;    
										begin
												if(xadrez[linOri,i-1] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[linOri,i-1] = 't') or (xadrez[linOri,i-1] = 'c') or (xadrez[linOri,i-1] = 'b') or (xadrez[linOri,i-1] = 'q') or (xadrez[linOri,i-1] = 'k') or (xadrez[linOri,i-1] = 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end;             
						if((dH = 0) and (peca = 'q')) then
						begin
								if(linOri < linDes ) then
								begin
										for i:=linOri to (linDes-1) do
										begin
												if(xadrez[i+1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i+1,colOri] = 'T') or (xadrez[i+1,colOri] = 'C') or (xadrez[i+1,colOri] = 'B') or (xadrez[i+1,colOri] = 'Q') or (xadrez[i+1,colOri] = 'K') or (xadrez[i+1,colOri]= 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
												
										end
								end;
								if(linOri > linDes ) then
								begin
										for i:=linOri downto (linDes+1) do    
										begin
												if(xadrez[i-1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i-1,colOri] = 'T') or (xadrez[i-1,colOri] = 'C') or (xadrez[i-1,colOri] = 'B') or (xadrez[i-1,colOri] = 'Q') or (xadrez[i-1,colOri] = 'K') or (xadrez[i-1,colOri]= 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end;
						if((dV = 0) and (peca = 'q')) then
						begin
								if(colOri < colDes ) then
								begin
										for i:=colOri to (colDes-1) do
										begin
												if(xadrez[linOri,i+1] = ' ') then    
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[linOri,i+1] = 'T') or (xadrez[linOri,i+1] ='C') or (xadrez[linOri,i+1] = 'B') or (xadrez[linOri,i+1] ='Q') or (xadrez[linOri,i+1] ='K') or (xadrez[linOri,i+1] = 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
												
										end
								end;
								if(colOri > colDes ) then
								begin
										for i:=colOri downto (colDes+1) do // enquanto colOri>colDes, i--;    
										begin
												if(xadrez[linOri,i-1] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[linOri,i-1] = 'T') or (xadrez[linOri,i-1] = 'C') or (xadrez[linOri,i-1] = 'B') or (xadrez[linOri,i-1] = 'Q') or (xadrez[linOri,i-1] = 'K') or (xadrez[linOri,i-1] = 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end;
						if((peca='Q') and (dV=dH)) then
						begin
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i+1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j-1]='t') or (xadrez[i+1,j-1]='c') or (xadrez[i+1,j-1]='b') or (xadrez[i+1,j-1]='q') or (xadrez[i+1,j-1]='k') or (xadrez[i+1,j-1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i-1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j-1]='t') or (xadrez[i-1,j-1]='c') or (xadrez[i-1,j-1]='b') or (xadrez[i-1,j-1]='q') or (xadrez[i-1,j-1]='k') or (xadrez[i-1,j-1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														i:=i-1;
										 		end
										 end
								end;
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i+1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j+1]='t') or (xadrez[i+1,j+1]='c') or (xadrez[i+1,j+1]='b') or (xadrez[i+1,j+1]='q') or (xadrez[i+1,j+1]='k') or (xadrez[i+1,j+1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i-1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j+1]='t') or (xadrez[i-1,j+1]='c') or (xadrez[i-1,j+1]='b') or (xadrez[i-1,j+1]='q') or (xadrez[i-1,j+1]='k') or (xadrez[i-1,j+1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i-1;
										 		end
										 end
								end
						end;
						if((peca='q') and (dV=dH)) then
						begin
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i+1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j-1]='T') or (xadrez[i+1,j-1]='C') or (xadrez[i+1,j-1]='B') or (xadrez[i+1,j-1]='Q') or (xadrez[i+1,j-1]='K') or (xadrez[i+1,j-1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i-1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j-1]='T') or (xadrez[i-1,j-1]='C') or (xadrez[i-1,j-1]='B') or (xadrez[i-1,j-1]='Q') or (xadrez[i-1,j-1]='K') or (xadrez[i-1,j-1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														i:=i-1;
										 		end
										 end
								end;
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i+1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j+1]='T') or (xadrez[i+1,j+1]='C') or (xadrez[i+1,j+1]='B') or (xadrez[i+1,j+1]='Q') or (xadrez[i+1,j+1]='K') or (xadrez[i+1,j+1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i-1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j+1]='T') or (xadrez[i-1,j+1]='C') or (xadrez[i-1,j+1]='B') or (xadrez[i-1,j+1]='Q') or (xadrez[i-1,j+1]='K') or (xadrez[i-1,j+1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i-1;
										 		end
										 end
								end
						end
						//moverPeca:=1;
						//mover:=1;
				end;
				if(((peca='K') or (peca='k')) and ((dV>=0)and(dV<=1))and ((dH>=0) and (dH<=1))) then
				begin
						if(peca= 'K') then
						begin
								if((xadrez[linDes,colDes] = 'P') or (xadrez[linDes,colDes] = 'T') or (xadrez[linDes,colDes] = 'B') or (xadrez[linDes,colDes] = 'C') or (xadrez[linDes,colDes] = 'Q') or (xadrez[linDes,colDes] = 'K')) then
								begin
										moverPeca:=9;
										mover:=0;
								end
								else
								begin
										mover:=1;
										moverPeca:=1;
								end
						end;
						if(peca= 'k') then
						begin
								if((xadrez[linDes,colDes] = 'p') or (xadrez[linDes,colDes] = 't') or (xadrez[linDes,colDes] = 'b') or (xadrez[linDes,colDes] = 'c') or (xadrez[linDes,colDes] = 'q' )or (xadrez[linDes,colDes] = 'k')) then
								begin
										moverPeca:=9;
										mover:=0;
								end
								else
								begin
										mover:=1;
										moverPeca:=1;
								end
						end
						//moverPeca:=1;
						//mover:=1;
				end;
				if(((peca='P')) and (((linDes - linOri)=1) or ((linDes - linOri)=2)) and ((dH=0) or (dH=dV))) then
				begin
						if((dH = 0)) then
						begin
								if(linOri < linDes ) then
								begin
										for i:=linOri to (linDes-1) do
										begin
												if(xadrez[i+1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i+1,colOri] = 't') or (xadrez[i+1,colOri] = 'c') or (xadrez[i+1,colOri] = 'b') or (xadrez[i+1,colOri] = 'q') or (xadrez[i+1,colOri] = 'k') or (xadrez[i+1,colOri]= 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
												
										end
								end;
								if(linOri > linDes ) then
								begin
										for i:=linOri downto (linDes+1) do    
										begin
												if(xadrez[i-1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i-1,colOri] = 't') or (xadrez[i-1,colOri] = 'c') or (xadrez[i-1,colOri] = 'b') or (xadrez[i-1,colOri] = 'q') or (xadrez[i-1,colOri] = 'k') or (xadrez[i-1,colOri]= 'p')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end;
						if(dV=dH) then
						begin
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i+1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j-1]='t') or (xadrez[i+1,j-1]='c') or (xadrez[i+1,j-1]='b') or (xadrez[i+1,j-1]='q') or (xadrez[i+1,j-1]='k') or (xadrez[i+1,j-1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i-1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j-1]='t') or (xadrez[i-1,j-1]='c') or (xadrez[i-1,j-1]='b') or (xadrez[i-1,j-1]='q') or (xadrez[i-1,j-1]='k') or (xadrez[i-1,j-1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														i:=i-1;
										 		end
										 end
								end;
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i+1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j+1]='t') or (xadrez[i+1,j+1]='c') or (xadrez[i+1,j+1]='b') or (xadrez[i+1,j+1]='q') or (xadrez[i+1,j+1]='k') or (xadrez[i+1,j+1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i-1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j+1]='t') or (xadrez[i-1,j+1]='c') or (xadrez[i-1,j+1]='b') or (xadrez[i-1,j+1]='q') or (xadrez[i-1,j+1]='k') or (xadrez[i-1,j+1]='p')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i-1;
										 		end
										 end
								end
						end;
						//moverPeca:=1;
						//mover:=1;
				end;
				if(((peca='p')) and (((linOri - linDes)=1)or ((linOri-linDes)=2)) and ((dH=0) or (dH=dV))) then
				begin
				    if((dH = 0)) then
						begin
								if(linOri < linDes ) then
								begin
										for i:=linOri to (linDes-1) do
										begin
												if(xadrez[i+1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i+1,colOri] = 'T') or (xadrez[i+1,colOri] = 'C') or (xadrez[i+1,colOri] = 'B') or (xadrez[i+1,colOri] = 'Q') or (xadrez[i+1,colOri] = 'K') or (xadrez[i+1,colOri]= 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end
												end
										end
								end;
								if(linOri > linDes ) then
								begin
										for i:=linOri downto (linDes+1) do    
										begin
												if(xadrez[i-1,colOri] = ' ') then
												begin
														mover :=1;
												end
												else
												begin
														if((xadrez[i-1,colOri] = 'T') or (xadrez[i-1,colOri] = 'C') or (xadrez[i-1,colOri] = 'B') or (xadrez[i-1,colOri] = 'Q') or (xadrez[i-1,colOri] = 'K') or (xadrez[i-1,colOri]= 'P')) then
														begin
																mover:=1;
														end
														else
														begin
																moverPeca:=9;
																mover:=0;
																break;
														end  	
												end
										end;
								end
						end;
						if((dV=dH)) then
						begin
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i+1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j-1]='T') or (xadrez[i+1,j-1]='C') or (xadrez[i+1,j-1]='B') or (xadrez[i+1,j-1]='Q') or (xadrez[i+1,j-1]='K') or (xadrez[i+1,j-1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) > (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri downto colDes+1 do
										 		begin
										 				if((xadrez[i-1,j-1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j-1]='T') or (xadrez[i-1,j-1]='C') or (xadrez[i-1,j-1]='B') or (xadrez[i-1,j-1]='Q') or (xadrez[i-1,j-1]='K') or (xadrez[i-1,j-1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														i:=i-1;
										 		end
										 end
								end;
								if((linOri) < (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i+1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i+1,j+1]='T') or (xadrez[i+1,j+1]='C') or (xadrez[i+1,j+1]='B') or (xadrez[i+1,j+1]='Q') or (xadrez[i+1,j+1]='K') or (xadrez[i+1,j+1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i+1;
										 		end
										 end
								end;
								if((linOri) > (linDes)) then
								begin
										 if ((colOri) < (colDes)) then
										 begin
										 		i:=linOri;
										 		for j:=colOri to colDes-1 do
										 		begin
										 				if((xadrez[i-1,j+1]=' '))  then
														begin
																mover:=1;
														end
														else
														begin
																if((xadrez[i-1,j+1]='T') or (xadrez[i-1,j+1]='C') or (xadrez[i-1,j+1]='B') or (xadrez[i-1,j+1]='Q') or (xadrez[i-1,j+1]='K') or (xadrez[i-1,j+1]='P')) then
																begin
																		mover :=1;
																end
																else
																begin
																		moverPeca:=9;
																		mover:=0;
																		break;
																end
														end;
														
														i:=i-1;
										 		end
										 end
								end
						end
						//moverPeca:=1;
						//mover:=1;
				end;
				if(mover = 1)then
				begin
						if(xadrez[linDes,colDes] <> ' ') then
						begin
								moverPeca:=2;
						end
						else
						begin
								xadrez[linDes,colDes] := xadrez [linOri,colOri];
								xadrez[linOri,colOri]:=' ';
								moverPeca:=1;
						end
				end
				else
				begin
						moverPeca:=9;
				end   
		end
		else  
		begin
				moverPeca:=0;
		end;
end;

function comerPeca(linOri,colOri,linDes,colDes:integer):integer;
var
peca : char;
temp : char;
Begin
		peca:=xadrez[linOri,colOri];
		temp:=xadrez[linDes,colDes];
		if((peca='T') or (peca='C') or (peca='B') or (peca='Q') or (peca='K') or (peca='P'))then
		begin
				if(temp='t') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' vai comer a Torre ');
						readkey;
						comerPeca:=1;
				end;
		    if(temp='c') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca: ',peca,' vai comer o Cavalo');
						readkey;
						comerPeca:=1;
				end;
				if(temp='b') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' vai comer o Bispo');
						readkey;
						comerPeca:=1;
				end;
				if(temp='q') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' vai comer a Rainha');
						readkey;
						comerPeca:=1;
				end;
				if(temp='k') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						writeln('O Rei esta em xeque!');
						readkey;
						writeln('A peca ',peca,' vai comer o Rei');
						readkey;
						comerPeca:=2;
				end;
				if(temp='p') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' vai comer o Peão');
						readkey;
						comerPeca:=1;
				end;
		end;
		if((peca='t') or (peca='c') or (peca='b') or (peca='q') or (peca='k') or (peca='p'))then
		begin
				if(temp='T') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' vai comer a Torre');
						readkey;
						comerPeca:=1;
				end;
		    if(temp='C') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' podera comer o Cavalo');
						readkey;
						comerPeca:=1;
				end;
				if(temp='B') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' podera comer o Bispo');
						readkey;
						comerPeca:=1;
				end;
				if(temp='Q') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' podera comer a Rainha');
						readkey;
						comerPeca:=1;
				end;
				if(temp='K') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						writeln('O Rei esta em xeque!');
						readkey;
						writeln('A peca ',peca,' podera comer o Rei');
						readkey;
						comerPeca:=2;
				end;
				if(temp='P') then
				begin
						xadrez[linDes][colDes]:=peca;
						xadrez[linOri][colOri]:=' ';
						write('A peca ',peca,' podera comer o Peão ');
						readkey;
						comerPeca:=1;
				end;
		end
End;
BEGIN
	InicializaMenu;
	readkey;
	xadrez[1,1]:='T' ; xadrez[1,2]:='C' ;  xadrez[1,3]:='B'; xadrez[1,4]:='Q' ; xadrez[1,5]:='K'; xadrez[1,6]:='B' ; xadrez[1,7]:='C'; xadrez[1,8]:='T';
	for i:=2 to 2 do
	begin
		for j:=1 to 8 do
		begin        
			xadrez[i,j]:='P';
		end;
	end;
	for i:=3 to 6 do
	begin
		for j:=1 to 8 do
		begin
			xadrez[i,j]:=' ';
		end;
	end;
	for i:=7 to 7 do
	begin
		for j:=1 to 8 do
		begin
			xadrez[i,j]:='p';
		end;
	end;
	xadrez[8,1]:='t' ; xadrez[8,2]:='c' ;  xadrez[8,3]:='b'; xadrez[8,4]:='q' ; xadrez[8,5]:='k'; xadrez[8,6]:='b' ; xadrez[8,7]:='c'; xadrez[8,8]:='t';  		
	c:=1;
	jogador1:=0;
	jogador2:=0;
	while (c=1) do
	begin
			a:=1;
			b:=1;
			while(((a)mod 2) <> 0 ) do      
			begin
					DesenhaTabuleiro;
					writeln('JOGADOR 1, eh sua vez de Jogar');
					writeln;
					writeln('Numero de pecas comidas pelo Jogador 1: ',jogador1,'');
					writeln;
        	writeln('Pecas brancas perdidas do seu jogo: ',jogador2,'');
        	writeln;
					write('Digite a linha e a coluna de origem : ');
					readln(linOri,colOri);                                 
					write('Digite a linha e a coluna de Destino : ');
					readln(linDes,colDes);
					peca:=xadrez[linOri,colOri];
					if((peca='T') or (peca='C') or (peca='B') or (peca='Q') or (peca='K') or (peca='P'))then
					begin                     
							resultado := moverPeca(linOri,colOri,linDes,colDes);
							comer:=comerPeca(linOri,colOri,linDes,colDes); 
							if(resultado = 1) then
							begin
									a:=a+1;
									DesenhaTabuleiro;
							end;
							if(resultado <> 1) then
							begin
									if(resultado = 9) then
									begin
											peca:=xadrez[linOri,colOri];
											writeln('A peca ',peca,' nao pode ser movida dessa forma. Jogue Novamente.');
											readkey;
											DesenhaTabuleiro;
									end;
									if(resultado = 0) then
									begin
											write('ERRO: Coordenadas Invalidas');
											readkey;
											DesenhaTabuleiro;
									end;
									if(resultado = 2) then
									begin
											a:=a+1;
											comerPeca(linOri,colOri,linDes,colDes);
											jogador1:=jogador1+1;
											if((comer=2)) then
											begin
													write('PARABENS, O JOGADOR 1 VENCEU O JOGO');
													readkey;
													c:=0; b:=2;
													break;
											end;
											DesenhaTabuleiro;
									end
							end
					end
					else
					begin
							writeln('Esta peca eh preta e voce nao pode movimenta-la. Jogue Novamente.');
							readkey;
					end
			end;
			while(((b)mod 2) <> 0 ) do      
			begin
					DesenhaTabuleiro;
					writeln('JOGADOR 2, eh sua vez de Jogar');
					writeln;
					writeln('Numero de pecas comidas pelo Jogador 2: ',jogador2,'');
					writeln;
        	writeln('Pecas pretas perdidas do seu jogo: ',jogador1,'');
        	writeln;
					write('Digite a linha e a coluna de origem : ');
					readln(linOri,colOri);                                
					write('Digite a linha e a coluna de Destino : ');
					readln(linDes,colDes);  
					peca:=xadrez[linOri,colOri];
					if((peca='t') or (peca='c') or (peca='b') or (peca='q') or (peca='k') or (peca='p'))then
					begin                   
							resultado := moverPeca(linOri,colOri,linDes,colDes);
							comer:=comerPeca(linOri,colOri,linDes,colDes);
							if(resultado = 1) then
							begin
									b:=b+1;
									DesenhaTabuleiro;
							end;
							if(resultado <> 1) then
							begin
									if(resultado = 9) then
									begin
											writeln('A peca ',peca,' nao pode ser movida dessa forma. Jogue Novamente!');
											readkey;
											DesenhaTabuleiro;
									end;
									if(resultado = 0) then
									begin
											write('ERRO: Coordenadas Invalidas');
											readkey;
											DesenhaTabuleiro;
									end;
									if(resultado = 2) then
									begin
											b:=b+1;
											comerPeca(linOri,colOri,linDes,colDes);
											jogador2:= jogador2+1;
											if((comer=2)) then
											begin
													writeln('PARABENS, O JOGADOR 2 VENCEU O JOGO');
													readkey;
													c:=0;a:=2;
													break;
											end;
											DesenhaTabuleiro;
									end
							end
					end
					else
					begin
							writeln('Esta peca eh branca e voce nao pode movimenta-la. Jogue Novamente');
							readkey;
					end
			end;
	end;
END.