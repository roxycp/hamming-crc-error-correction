.model small

.stack 200h

.data
      p1                                       dw 0
      p2                                       dw 0
      p4                                       dw 0
      p8                                       dw 0
      numar                                    dw 00001000101b      ;mesajul util
      numar_binar_generator_de_pozitiile_lui_p dw 0                 ; 0  0  C1 0  C2 C3 C4 0   C5 C6 C7 C8 C9 C10 C11 0 in binar
      numar_binar_generator_de_pozitiile_lui_a dw 0                 ; p1 p2 0  p4 0  0  0  p8  0  0  0  0  0  0   0   0 in binar
      cod_final                                dw ?
.code
      start:
            mov  AX, @data
            mov  ds, AX

      ;p1+C11+C9+C7+C5+C4+C2+C1=0
      ;p2+C11+C10+C7+C6+C4+C3+C1=0
      ;p4+C11+C10+C9+C8+C4+C3+C2=0
      ;p8+C11+C10+C9+C8+C7+C6+C5=0
      ;p1,p2,p3,p4 pot fi calculate in functie de sumele respective de a1*C1+a2*C2+...+a11*C11, unde ai=1 sau ai=0
      ;p16=0 oricare ar fi numar

      ;ITERATIA 1
      ;Extragem ultima cifra din numar

            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 10b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
            mov  BX, p1
            add  BX, CX
            mov  p1, BX
  
            mov  BX, p2
            add  BX, CX
            mov  p2, BX

            mov  BX, p4
            add  BX, CX
            mov  p4, BX
   
            mov  BX, p8
            add  BX, CX
            mov  p8, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 2
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 100b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
  
            mov  BX, p2
            add  BX, CX
            mov  p2, BX

            mov  BX, p4
            add  BX, CX
            mov  p4, BX
   
            mov  BX, p8
            add  BX, CX
            mov  p8, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 3
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 1000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
            mov  BX, p1
            add  BX, CX
            mov  p1, BX

            mov  BX, p4
            add  BX, CX
            mov  p4, BX
   
            mov  BX, p8
            add  BX, CX
            mov  p8, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 4
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 10000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming

            mov  BX, p4
            add  BX, CX
            mov  p4, BX
   
            mov  BX, p8
            add  BX, CX
            mov  p8, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 5
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 100000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
            mov  BX, p1
            add  BX, CX
            mov  p1, BX
  
            mov  BX, p2
            add  BX, CX
            mov  p2, BX
   
            mov  BX, p8
            add  BX, CX
            mov  p8, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 6
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 1000000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
  
            mov  BX, p2
            add  BX, CX
            mov  p2, BX
   
            mov  BX, p8
            add  BX, CX
            mov  p8, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 7
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 10000000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
            mov  BX, p1
            add  BX, CX
            mov  p1, BX
   
            mov  BX, p8
            add  BX, CX
            mov  p8, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 8
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 1000000000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
            mov  BX, p1
            add  BX, CX
            mov  p1, BX
  
            mov  BX, p2
            add  BX, CX
            mov  p2, BX

            mov  BX, p4
            add  BX, CX
            mov  p4, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 9
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 10000000000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
            mov  BX, p2
            add  BX, CX
            mov  p2, BX

            mov  BX, p4
            add  BX, CX
            mov  p4, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;ITERATIA 10
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 100000000000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
            mov  BX, p1
            add  BX, CX
            mov  p1, BX

            mov  BX, p4
            add  BX, CX
            mov  p4, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX
   
      ;ITERATIA 11
      ;Extragem ultima cifra din numar
            mov  AX, numar
            mov  BX, 10b
            div  BX
            push AX

            mov  CX,DX

      ;construim variabila numar_binar_generator_de_pozitiile_lui_p
            mov  AX, 10000000000000b
            mul  CX
            add  AX, numar_binar_generator_de_pozitiile_lui_p
            mov  numar_binar_generator_de_pozitiile_lui_p, AX

      ;adunam ultima cifra la variabilele corespunzatoare codului hamming
            mov  BX, p1
            add  BX, CX
            mov  p1, BX
  
            mov  BX, p2
            add  BX, CX
            mov  p2, BX

      ;Eliminam ultima cifra din numar
            pop  AX
            mov  numar, AX

      ;Daca suma C11+C9+C7+C5+C4+C2+C1 calculata in variabila p1, avand in vedere ca p1 ∈ Z2, este impara atunci p1 trebuie sa fie 1 sau daca este para atunci p1 trebuie sa fie 0
      ;Verificam paritatea p1
            mov  AX, p1
            and  AX, 1
            mov  p1,AX

      ;Daca suma C11+C10+C7+C6+C4+C3+C1 calculata in variabila p2, avand in vedere ca p2 ∈ Z2, este impara atunci p2 trebuie sa fie 1 sau daca este para atunci p2 trebuie sa fie 0
      ;Verificam paritatea p2
            mov  AX, p2
            and  AX, 1
            mov  p2,AX

      ;Daca suma 11+C10+C9+C8+C4+C3+C2 calculata in variabila p4, avand in vedere ca p4 ∈ Z2, este impara atunci p4 trebuie sa fie 1 sau daca este para atunci p4 trebuie sa fie 0
      ;Verificam paritatea p4
            mov  AX, p4
            and  AX, 1
            mov  p4,AX

      ;Daca suma C11+C10+C9+C8+C7+C6+C5 calculata in variabila p8, avand in vedere ca p8 ∈ Z2, este impara atunci p8 trebuie sa fie 1 sau daca este para atunci p8 trebuie sa fie 0
      ;Verificam paritatea p8
            mov  AX, p8
            and  AX, 1
            mov  p8,AX
         

      ;Construim in numar_binar_generator_de_pozitiile_lui_a un numar de forma p1 p2 0 p4 0 0 0 p8 0 0 0 0 0 0 0 0
            mov  AX, 1000000000000000b
            mov  BX, p1
            mul  BX
            add  numar_binar_generator_de_pozitiile_lui_a,AX

            mov  AX, 100000000000000b
            mov  BX, p2
            mul  BX
            add  numar_binar_generator_de_pozitiile_lui_a,AX

            mov  AX, 1000000000000b
            mov  BX, p4
            mul  BX
            add  numar_binar_generator_de_pozitiile_lui_a,AX

            mov  AX, 100000000b
            mov  BX, p8
            mul  BX
            add  numar_binar_generator_de_pozitiile_lui_a,AX

      ;Prin operatia XOR CX, numar_binar_generator_de_pozitiile_lui_p, ar trebui sa obtinem mesajul util codificat

            mov  CX, numar_binar_generator_de_pozitiile_lui_a
            XOR  CX, numar_binar_generator_de_pozitiile_lui_p
            mov  cod_final,CX

            mov  AH, 4Ch
            int  21h
end start