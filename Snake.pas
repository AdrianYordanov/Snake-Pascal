   USES crt;

   LABEL 0;     {Ot tozi etiket zapochva  tqloto na programata}

   {snakeX, snakeY: pazqt vseki koordinat na zmiqta v masivi}
   VAR snakeX:ARRAY[0..200] OF byte;
       snakeY:ARRAY[0..200] OF byte;

       foodX,foodY,foodCharacter:byte; 	 {foodX,foodY: Koordinati na hranata; foodCharacter: Ima stoinost na ASCII kod chrez koito se opredelq kak da izglejda hranata}
       lifes,snakeDirection,score:byte;  {lifes: Jivoti; snakeDirection: Posoka na zmiqta score: Tekusht rezultat(tochki) }
       snakeSpeed,snakeSpeedLevel:byte;  {snakeSpeed: Opredelq kolko da e barza zmiqta; snakeSpeedLevel: pokazva skorostta(naprimer 5) }
       i,j:integer;            		     {i,j: Rezervni promenlivi(polzvat se za indeksatori) }
       key:char;                  		 {key: Kogato se polzva keypessed}

       {Tazi procedura izpisva s golemi bukvi dumata SNAKE}
       PROCEDURE SNAKE;BEGIN
                            clrscr;
                            textbackground(red);

                            FOR i:=7 TO 8 DO BEGIN gotoxy(6,i);write('         ');delay(70); END;
                            gotoxy(6,9);write('   ');delay(70);
                            FOR i:=10 TO 11 DO BEGIN gotoxy(6,i);write('         ');delay(70); END;
                            gotoxy(12,12);write('   '); delay(70);
                            FOR i:=13 TO 14 DO BEGIN gotoxy(6,i);write('         ');delay(70); END;

                            FOR i:=7 TO 14 DO BEGIN gotoxy(18,i);write('   ');delay(35);gotoxy(25,i);write('   ');delay(35); END;
                            FOR i:=9 TO 12 DO BEGIN gotoxy(i+12,i);write(' ');delay(70); END;

                            j:=31;
                            FOR i:=14 DOWNTO 7 DO BEGIN gotoxy(j,i);write('   ');delay(70);j:=j+1; END;
                            FOR i:=7 TO 14 DO BEGIN gotoxy(j,i);write('   ');delay(70);j:=j+1; END;
                            gotoxy(36,12);write('        ');

                            j:=52;FOR i:=7 TO 14 DO BEGIN gotoxy(j,i);write('   ');delay(70); END;
                            j:=55;FOR i:=10 DOWNTO 7 DO BEGIN gotoxy(j,i);write('   ');delay(70);j:=j+1; END;
                            j:=55;FOR i:=11 TO 14 DO BEGIN gotoxy(j,i);write('   ');delay(70);j:=j+1; END;

                            j:=64;
                            FOR i:=7 TO 14 DO BEGIN gotoxy(j,i);write('   ');delay(70); END;
                            FOR i:=7 TO 8 DO BEGIN gotoxy(j,i);write('         ');delay(70); END;
                            FOR i:=10 TO 11 DO BEGIN gotoxy(j,i);write('         ');delay(70); END;
                            FOR i:=13 TO 14 DO BEGIN gotoxy(j,i);write('         ');delay(70); END;

                            textbackground(black);
                            gotoxy(25,2);write('Developer: Adrian Yordanov');
                            gotoxy(21,4);write('Software used: Dev-Pascal 1.9.2');
                            gotoxy(25,24);write('Press CTRL+A to continue . . . ');

                            WHILE key<>#1 DO BEGIN
                                                textbackground(white);j:=39;
                                                FOR i:=39 TO 72 DO BEGIN gotoxy(i,16);write(' '); gotoxy(j,16);write(' '); j:=j-1;delay(1); END;
                                                textbackground(black);
                                                FOR i:=5 TO 72 DO BEGIN gotoxy(i,16);write(' '); END;
                                                IF keypressed THEN key:=readkey;
                                           END;
                       END;

       {Tazi procedura izvejda cqloto igralno pole}
       PROCEDURE start;BEGIN
                            clrscr;
                            textcolor(white);
                            FOR i:=3 TO 71 DO BEGIN textbackground(white);gotoxy(i,1);write(' ');i:=i+1;END;
                            FOR i:=4 TO 70 DO BEGIN textbackground(red);gotoxy(i,1);write(' ');i:=i+1;END;
                            gotoxy(3,2);write(' ');
                            gotoxy(71,2);write(' ');
                            textbackground(black);
                            gotoxy(7,2);write('Developer: Adrian Yordanov');
                            gotoxy(37,2);write('Software used: Dev-Pascal 1.9.2');

                            FOR i:=3 TO 71 DO BEGIN textbackground(white);gotoxy(i,3);write(' ');i:=i+1;END;
                            FOR i:=4 TO 70 DO BEGIN textbackground(red);gotoxy(i,3);write(' ');i:=i+1;END;

                            FOR i:=53 TO 71 DO BEGIN textbackground(white);gotoxy(i,5);write(' ');i:=i+1;END;
                            FOR i:=54 TO 70 DO BEGIN textbackground(red);gotoxy(i,5);write(' ');i:=i+1;END;

                            FOR i:=53 TO 71 DO BEGIN textbackground(white);gotoxy(i,17);write(' ');i:=i+1;END;
                            FOR i:=54 TO 70 DO BEGIN textbackground(red);gotoxy(i,17);write(' ');i:=i+1;END;

                            FOR i:=53 TO 71 DO BEGIN textbackground(red);gotoxy(i,20);write(' ');i:=i+1;END;
                            FOR i:=54 TO 70 DO BEGIN textbackground(white);gotoxy(i,20);write(' ');i:=i+1;END;

                            FOR i:=3 TO 71 DO BEGIN textbackground(white);gotoxy(i,23);write(' ');i:=i+1;END;
                            FOR i:=4 TO 70 DO BEGIN textbackground(red);gotoxy(i,23);write(' ');i:=i+1;END;


                            FOR i:=3 TO 23 DO BEGIN textbackground(white);gotoxy(3,i);write(' ');i:=i+1;END;
                            FOR i:=4 TO 22 DO BEGIN textbackground(red);gotoxy(3,i);write(' ');i:=i+1;END;

                            FOR i:=3 TO 23 DO BEGIN textbackground(white);gotoxy(53,i);write(' ');i:=i+1;END;
                            FOR i:=4 TO 22 DO BEGIN textbackground(red);gotoxy(53,i);write(' ');i:=i+1;END;

                            FOR i:=18 TO 22 DO BEGIN textbackground(white);gotoxy(62,i);write(' ');i:=i+1;END;
                            FOR i:=19 TO 21 DO BEGIN textbackground(red);gotoxy(62,i);write(' ');i:=i+1;END;

                            FOR i:=3 TO 23 DO BEGIN textbackground(white);gotoxy(71,i);write(' ');i:=i+1;END;
                            FOR i:=4 TO 22 DO BEGIN textbackground(red);gotoxy(71,i);write(' ');i:=i+1;END;

                            textbackground(black);

                            gotoxy(57,8);write('Controllers:');
                            gotoxy(57,10);write('A   (left)');
                            gotoxy(57,11);write('D   (right)');
                            gotoxy(57,12);write('W   (up)');
                            gotoxy(57,13);write('S   (down)');
                            gotoxy(57,14);write('ESC (pause)');

                            gotoxy(56,4);write('Version: 1.0');

                            gotoxy(55,18);write('score');
                            gotoxy(57,19);write(score);

                            gotoxy(64,18);write('lifes');
                            gotoxy(65,19);
                            IF lifes=1 THEN write(#3);
                            IF lifes=2 THEN write(#3,#3);
                            IF lifes=3 THEN write(#3,#3,#3);

                            gotoxy(54,21);write('progress');
                            gotoxy(57,22);write(score div 2,'%');

                            gotoxy(64,21);write('speed');
                            gotoxy(66,22);write(snakeSpeedLevel);
                       END;

       {Spored snakeDirection se opredelq posokata na zmiqta}
       PROCEDURE direction;BEGIN
                                CASE snakeDirection OF
                                1:snakeX[0]:=snakeX[0]-1;         {Ako snakeDirection ima stoinost 1 - zmiqta vurvi nalqvo}
                                2:snakeX[0]:=snakeX[0]+1;         {Ako snakeDirection ima stoinost 2 - zmiqta vurvi nadqsno}
                                3:snakeY[0]:=snakeY[0]-1;         {Ako snakeDirection ima stoinost 3 - zmiqta vurvi nagore}
                                4:snakeY[0]:=snakeY[0]+1;         {Ako snakeDirection ima stoinost 4 - zmiqta vurvi nadolu}
                                END;
                           END;

       {Tazi procedura kade se izvede hranata ili jivota}
       PROCEDURE xyz;BEGIN
                          foodX:=random(48)+4;
                          foodY:=random(19)+4;
                          FOR i:=0 TO score DO IF (snakeX[i]=foodX) AND (snakeY[i]=foodY) THEN xyz;

                          foodCharacter:=random(6)+1;
                          IF (foodCharacter=6) AND (lifes<3) AND (score mod 3=0) THEN foodCharacter:=6 ELSE foodCharacter:=random(5)+1;

                          gotoxy(foodX,foodY);
                          CASE foodCharacter OF
                          1:write(#2);
                          2:write(#4);
                          3:write(#5);
                          4:write(#6);
                          5:write(#15);
                          6:write(#3);
                          END;
                     END;

       {Kogato igrata prikluchi se izpulnqva tazi posledna procedura koqto ti pokazva s kolko tochki si zavurshil}
       PROCEDURE quit;BEGIN
                           SNAKE;
                           gotoxy(20,18);write('Your score: ',score);
                           gotoxy(40,18);write('Your progress: ',score div 2,'%');
                           gotoxy(25,20);IF score=200 THEN write('Congratulations, you win.') ELSE write('You loose, ',100-(score div 2),'% left to the win.');

                           gotoxy(25,24);write('                               ');
                           gotoxy(25,24);write('Press CTRL+Q to quit . . . ');
                           key:=#0;WHILE key<>#17 DO key:=readkey; {Podtikvane da se natisne klavishnata kombinaciq CTRL+snakeX za da zapochne igrata}
                           halt;
                      END;

       {Tazi procedura se izpulnqva kogato se blusne ili prehape zmiqta}
       PROCEDURE check;BEGIN
                            lifes:=lifes-1;
                            IF lifes=0 THEN quit;
                            snakeX[0]:=28;snakeY[0]:=13;
                            FOR i:=1 TO score DO BEGIN snakeX[i]:=1;snakeY[i]:=1;END;
                            start;xyz;
                            GOTO 0;
                       END;



   BEGIN
        randomize;     {Garantira dobro razmesvane, kogato se polzva random() }
        SNAKE;
        snakeX[0]:=28;
        snakeY[0]:=13;

        score:=0;
        lifes:=3;
        {Skorostta e 200(kolkoto e po-niska stoinostta, tolkova i po-burza zmiqta) }
        snakeSpeed:=200;
        snakeSpeedLevel:=1;
        snakeDirection:=random(4)+1;
        start;

        {Podtikvane da se natisne klavishnata kombinaciq CTRL+snakeX za da zapochne igrata}
        gotoxy(18,13);write('Press CTRL+A to start . . . ');
        key:=#0;WHILE key<>#1 DO key:=readkey;
        gotoxy(18,13);write('                            ');
        xyz; {Izvejda se hranata}


        {Ako zmiqta ima poveche ot 1 koordinat togava
         vseki koordinat ot posledniqt do vtoriqt(vkluchitelno) vzima za stoinost koordinata pred nego }
      0:IF score>1 THEN FOR i:=score DOWNTO 2 DO BEGIN snakeX[i]:=snakeX[i-1];snakeY[i]:=snakeY[i-1];END;

        direction; {Glavata na zmiqta se pridvijva}

        IF score>0 THEN BEGIN {Ako zmiqta ima purvi koordinat, toi se podnovqva}
                         CASE snakeDirection OF
                         1:BEGIN snakeX[1]:=snakeX[0]+1;snakeY[1]:=snakeY[0];END;
                         2:BEGIN snakeX[1]:=snakeX[0]-1;snakeY[1]:=snakeY[0];END;
                         3:BEGIN snakeY[1]:=snakeY[0]+1;snakeX[1]:=snakeX[0];END;
                         4:BEGIN snakeY[1]:=snakeY[0]-1;snakeX[1]:=snakeX[0];END;
                         END;
                    END;



        textbackground(red);gotoxy(snakeX[0],snakeY[0]);write(' ');
        textbackground(cyan);IF score>0 THEN BEGIN gotoxy(snakeX[1],snakeY[1]);write(' '); END;
        textbackground(black);



        IF (snakeDirection=1) OR (snakeDirection=2) THEN delay(snakeSpeed);
        IF (snakeDirection=3) OR (snakeDirection=4) THEN delay(snakeSpeed+50);
        {Sled kato zmiqta se i predvijila se izchakva opredeleno vreme}


        {Proverka dali zmiqta se e prehapala, ako se e prehapala zapochva procedurata check}
        FOR i:=4 TO score DO IF (snakeX[0]=snakeX[i]) AND (snakeY[0]=snakeY[i]) THEN check;

        {Proverka dali zmiqta se e blusnala v stenite, ako se e blusnala zapochva procedurata check}
        IF (snakeX[0]=3) OR (snakeX[0]=53) OR (snakeY[0]=3) OR (snakeY[0]=23) THEN check;

        IF (snakeX[0]=foodX) AND (snakeY[0]=foodY) THEN BEGIN
                                           IF foodCharacter=6 THEN BEGIN
                                                            lifes:=lifes+1;
                                                            IF lifes>3 THEN lifes:=3;
                                                            IF lifes=2 THEN BEGIN gotoxy(65,19);write(#3,#3);END;
                                                            IF lifes=3 THEN BEGIN gotoxy(65,19);write(#3,#3,#3);END;
                                                       END;

                                           IF foodCharacter<>6 THEN BEGIN
                                                             IF score>0 THEN BEGIN gotoxy(snakeX[1],snakeY[1]);textbackground(white);write(' ');textbackground(black); END;

                                                             score:=score+1;
                                                             gotoxy(57,19);write(score);
                                                             gotoxy(57,22);write(score div 2,'%');
                                                             snakeX[score]:=snakeX[score-1];snakeY[score]:=snakeY[score-1];

                                                             IF snakeSpeed>70 THEN BEGIN snakeSpeed:=snakeSpeed-10;snakeSpeedLevel:=snakeSpeedLevel+1;END;
                                                             gotoxy(66,22);write(snakeSpeedLevel);

                                                             IF score=200 THEN quit;
                                                        END;

                                           xyz;
                                           delay(500);
                                      END;

        IF keypressed THEN BEGIN   {Ako se natisne kopche}
                                key:=readkey;
                                IF key=#27 THEN BEGIN
                                                   key:=#0;
                                                   CASE snakeDirection OF
                                                   1:BEGIN WHILE (key<>'W') AND (key<>'w') AND (key<>'S') AND (key<>'s') AND (key<>'A') AND (key<>'a') AND (key<>#27) DO key:=readkey;END;
                                                   2:BEGIN WHILE (key<>'W') AND (key<>'w') AND (key<>'S') AND (key<>'s') AND (key<>'D') AND (key<>'d') AND (key<>#27) DO key:=readkey;END;
                                                   3:BEGIN WHILE (key<>'A') AND (key<>'a') AND (key<>'D') AND (key<>'d') AND (key<>'W') AND (key<>'w') AND (key<>#27) DO key:=readkey;END;
                                                   4:BEGIN WHILE (key<>'A') AND (key<>'a') AND (key<>'D') AND (key<>'d') AND (key<>'S') AND (key<>'s') AND (key<>#27) DO key:=readkey;END;
                                                   END;
                                              END;

                                CASE snakeDirection OF   {Promenlivata snakeDirection se opredelq ot natisnatoto kopche}
                                1,2:BEGIN IF (key='W') OR (key='w') THEN snakeDirection:=3;IF (key='S') OR (key='s') THEN snakeDirection:=4;END;
                                3,4:BEGIN IF (key='A') OR (key='a') THEN snakeDirection:=1;IF (key='D') OR (key='d') THEN snakeDirection:=2;END;   
                                END;
                           END;


         {Posledniqt koordinat se iztriva}
        gotoxy(snakeX[score],snakeY[score]);write(' ');
        GOTO 0;
   END.
