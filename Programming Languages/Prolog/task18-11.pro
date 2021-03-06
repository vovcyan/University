encoding(utf8).

'мужчина'('Адам').
'мужчина'('Каин').
'мужчина'('Авель').
'мужчина'('Майкл').
'мужчина'('Моисей').
'мужчина'('Альберт').
'мужчина'('Эрнест').
'мужчина'('Гектор').
'мужчина'('Ганнибал').
'мужчина'('Александр').
'мужчина'('Филипп').

'женщина'('Ева').
'женщина'('Мадонна').
'женщина'('Мария').
'женщина'('Алиса').
'женщина'('Мэри').
'женщина'('Диана').
'женщина'('Сара').
'женщина'('Барбара').
'женщина'('Роза').
'женщина'('Алла').
'женщина'('Кристина').
'женщина'('Марианна').

'родитель'('Адам', 'Каин').
'родитель'('Адам', 'Авель').
'родитель'('Адам', 'Сара').
'родитель'('Моисей', 'Мэри').
'родитель'('Моисей', 'Майкл').
'родитель'('Каин', 'Алиса').
'родитель'('Каин', 'Диана').
'родитель'('Каин', 'Мадонна').
'родитель'('Майкл', 'Барбара').
'родитель'('Майкл', 'Гектор').
'родитель'('Майкл', 'Роза').
'родитель'('Майкл', 'Филипп').
'родитель'('Филипп', 'Кристина').
'родитель'('Ганнибал', 'Александр').
'родитель'('Ганнибал', 'Эрнест').
'родитель'('Александр', 'Альберт').
'родитель'('Альберт', 'Марианна').
'родитель'('Ева', 'Каин').
'родитель'('Ева', 'Авель').
'родитель'('Ева', 'Сара').
'родитель'('Сара', 'Мэри').
'родитель'('Сара', 'Майкл').
'родитель'('Мария', 'Алиса').
'родитель'('Мария', 'Гектор').
'родитель'('Мария', 'Диана').
'родитель'('Мария', 'Мадонна').
'родитель'('Мадонна', 'Барбара').
'родитель'('Мадонна', 'Роза').
'родитель'('Мадонна', 'Филипп').
'родитель'('Алла', 'Кристина').
'родитель'('Диана', 'Александр').
'родитель'('Барбара', 'Эрнест').
'родитель'('Барбара', 'Альберт').
'родитель'('Кристина', 'Марианна').

'потомок'(Y, X) :- 'родитель'(X, Z), 'женщина'(Z)
                 , 'родитель'(Z, Y).
'потомок'(Y, X) :- 'родитель'(X, Z), 'женщина'(Z)
                 , 'потомок'(Y, Z).

'предок'(Y, X) :- 'родитель'(Z, X), 'мужчина'(Z)
                , 'родитель'(Y, Z).
'предок'(Y, X) :- 'родитель'(Z, X), 'мужчина'(Z)
                , 'предок'(Y, Z).

'тетя'(X, Y) :- 'женщина'(X)
              , 'родитель'(Z, Y), Z \= X
              , 'родитель'(M, X)
              , 'родитель'(M, Z).

'шурин'(X, Y) :- 'мужчина'(X), 'мужчина'(Y)
               , 'родитель'(P, X)
               , 'родитель'(P, S), 'женщина'(S)
               , 'родитель'(S, C)
               , 'родитель'(Y, C).

subtask1 :- 'потомок'(X, 'Адам'), write(X).
subtask2 :- 'предок'(X, 'Альберт'), write(X).
subtask3 :- 'тетя'(X, Y), write(X), write(' тетя '), write(Y), nl.
subtask4 :- 'шурин'(X, Y), write(X), write(' шурин '), write(Y), nl.