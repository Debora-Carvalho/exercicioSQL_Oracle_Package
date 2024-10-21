-- Função para o Cálculo do INSS
-- INSS será igual a 20% do SB

CREATE OR REPLACE FUNCTION FUNC_CALC_INSS
(
    V_SB IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN V_SB * 0.20;
END;

-- Bloco anônimo alternativo(FUNC_CALC_INSS), utilizando a função como variável, pois a função passa a valer o valor do RETURN
BEGIN
    DBMS_OUTPUT.PUT_LINE('INSS: ' || FUNC_CALC_INSS(7000));
END;

-- Função para o Cálculo do FGTS
-- FGTS será igual a 8% do SB.

CREATE OR REPLACE FUNCTION FUNC_CALC_FGTS 
(
    V_SB IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN V_SB * 0.08;
END;

-- Bloco anônimo alternativo (FUNC_CALC_FGTS), utilizando a função como variável, pois a função passa a valer o valor do RETURN
BEGIN
    DBMS_OUTPUT.PUT_LINE('FGTS: ' || FUNC_CALC_FGTS(7000));
END;

-- Função para o Cálculo do Convênio Médico
-- SB < 2000, então CM terá valor de 200.00
-- SB >= 2000 e < 5000, então CM terá valor de 350.00
-- SB >= 5000, então CM terá valor de 500.00

CREATE OR REPLACE FUNCTION FUNC_CALC_CM
(
    V_SB IN NUMBER 
)
RETURN NUMBER
IS
BEGIN
    IF V_SB < 2000 THEN
        RETURN V_SB - 200.00;
    ELSE IF V_SB < 5000 THEN
            RETURN V_SB - 350.00;
        ELSE RETURN V_SB - 500.00;
        END IF;
    END IF;
END;

-- Bloco anônimo alternativo (FUNC_CALC_FGTS), utilizando a função como variável, pois a função passa a valer o valor do RETURN
BEGIN
    DBMS_OUTPUT.PUT_LINE('Convênio médico(CM): ' || FUNC_CALC_CM(7000));
END;


-- Função para o Cálculo do Bônus por Departamento