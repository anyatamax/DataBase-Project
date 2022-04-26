CREATE TABLE Songs.Album
(
    album_id     SERIAL PRIMARY KEY,
    album_name   VARCHAR(255)                      NOT NULL,
    songs_number INTEGER CHECK (songs_number >= 0) NOT NULL,
    descriptions TEXT
);

CREATE TABLE Songs.Genre
(
    genre_id     SERIAL PRIMARY KEY,
    genre_name   VARCHAR(255) NOT NULL,
    descriptions TEXT
);

CREATE TABLE Songs.Song
(
    song_id   SERIAL PRIMARY KEY,
    album_id  SERIAL REFERENCES Songs.Album (album_id),
    song_name VARCHAR(255) NOT NULL,
    song_time TIME         NOT NULL,
    genre_id  SERIAL REFERENCES Songs.Genre (genre_id),
    year      SMALLINT     NOT NULL CHECK (year >= 0),
    country   VARCHAR(255)
);

CREATE TABLE Songs.Musician
(
    musician_id   SERIAL PRIMARY KEY,
    musician_name VARCHAR(255) NOT NULL,
    songs_number  INTEGER      NOT NULL CHECK (Musician.songs_number >= 0),
    descriptions  TEXT
);

CREATE TABLE Songs.ID_keys_musician
(
    song_id     SERIAL REFERENCES Songs.Song (song_id),
    musician_id SERIAL REFERENCES Songs.musician (musician_id),
    CONSTRAINT FK_Musician_key PRIMARY KEY (song_id, musician_id)
);

CREATE TABLE Songs.Songs_music_video
(
    song_id      SERIAL REFERENCES Songs.Song (song_id),
    reference    VARCHAR(255) NOT NULL,
    descriptions TEXT,
    CONSTRAINT PK_song_key PRIMARY KEY (song_id)
);

CREATE TABLE Songs.TOP_charts
(
    song_id             SERIAL REFERENCES Songs.Song (song_id),
    place_song          INTEGER NOT NULL,
    comments_about_song TEXT,
    CONSTRAINT PK_song_key_charts PRIMARY KEY (song_id)
);

SELECT * FROM Songs.TOP_charts;

------------------------------------------------------------------------------------------------------------------------

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Малышка - Single', 1, '');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Несокрушимые', 8, '«Этот альбом - моя исповедь, и каждый человек так же способен исповедоваться", -говорит Эдуард Шарлот о "РОЖДЕННОМ В АДУ", Каждой из песен я подаю примеры, раскрывая тайны глубоких чувств, не прикрывая свои ошибки плотным звуком и дешевым словом».
Действительно, искренние поп-открытия из Самары больше похожи на дневниковые записи, эмоционально пропетые под звонкое фортепиано и легконький бит.');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Beauty Behind the Madness', 14, 'Абель Тесфайе эффективно трансформировался из таинственного R&B новатора в полноценную поп-звезду. В 2011 The Weeknd выпустил знаковую для себя трилогию микстейпов, в 2014 записал песни "Earned it", "Where you belong" для саундтрека к фильму "Пятьдесят оттенков серого". Певец возвращается с новой коллекцией атмосферных мелодий в этом альбоме, где нашлось место для вокальной эквилибристике и гипнотическому груву.');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Starboy', 18, 'Это третья полноформатная работа канадского артиста и очередная вылазка на неизведанные территории: электронные эксперименты, пронзительный вокал, сумрачная атмосфера и хип-хоп грув, колоритные мелодии и самый необычный звук в современном поп-мейнстриме');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Deluxe', 16, 'Британский автор-исполнитель Эд Ширан, покоривший сердца миллионов слушателей своими неподдельно искренними песнями, в очередной раз выдерживает точный баланс между красотой мелодий и простотой аранжировок.');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Born to Die', 12, 'второй студийный альбом американской певицы Ланы Дель Рей, выпущенный 27 января 2012 года на лейблах Interscope, Polydor и Stranger Records. В работе над альбомом с певицей сотрудничали продюсеры Эмиль Хейни, Патрик Бергер, Крис Брайдruen, Рик Ноуэлс, Robopopruen, Эл Шуксruen, Джефф Бхаскер и Джастин Паркер. Композиции пластинки выдержаны в жанрах альтернативной музыки, барокко-попа, инди-попа, трип-хопа и рока.
Темы альбома — любовь, секс, наркотики. Альбом содержит отсылки к американской культурной жизни 1950-х и 1960-х годов. Born to Die получил смешанные отзывы от музыкальных критиков. Многие рецензенты хвалили его оригинальное звучание, однако критиковали за однообразие и мелодраматизм.');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 14, 'дебютный студийный альбом американской певицы Билли Айлиш, выпущенный 29 марта 2019 года лейблами Darkroom и Interscope.
Бо́льшая часть песен была написана в период подготовки мини-альбома Don’t Smile at Me (2017). Композиции должны были стать частью студийного альбома, выпуск которого предполагался в 2017 году, однако, вместо него был выпущен мини-альбом Don’t Smile at Me. 21 марта 2019 года за неделю до выпуска, альбом добавили более 800 000 человек в список предварительного прослушивания на Apple Music, что стало самым высоким показателем данного сервиса');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Bandana 1', 14, 'Bandana» — заглавная песня альбома, ставшая второй самой прослушиваемой после трека «99 Problems». Как и весь альбом, песня пропитана криминальным вайбом вперемешку с текстами о деньгах, преступлениях и наркотиках.
За основу был взят трек «Deep Enough» группы LIVE. Песня является саундтреком самой первой части из серии фильмов Форсаж. Это крайне символично, ведь альбом BANDANA I является самой первой крупной работой Олега и Егора.');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('ARGUMENTS & FACTS - EP', 5, '«Музыка всегда была для меня самым интересным развлечением, это все как эксперименты в лаборатории — ограничения есть только в голове», — слова истинно увлеченного хип-хопом Big Baby Tape. Его творчество запросто можно воспринимать как некую жанровую энциклопедию, в которой по-своему упорядочены многочисленные стили, так или иначе повлиявшие на артиста. От хлестких битов Мемфиса 90-х до минималистичных трэп-зарисовок, отражающих суть новой школы, «ARGUMENTS & FACTS» — это короткое, но заряженное заявление о состоявшемся успехе молодого исполнителя');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Magic City', 12, 'Второй студийный альбом сделал исполнителя мелодичного трэпа одним из самых заметных игроков на русскоязычной хип-хоп-сцене. Росту популярности немало поспособствовал ремикс трека «Безумие», записанный при участии Oxxxymiron, но ЛСП есть что предложить слушателю и помимо него. «Magic City» ловко балансирует между комичным взрывным трэпом («Уровни», «Пусть говорят») и трагичными, полными надрывного отчаяния номерами, столь характерными для музыканта.');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Улыбнись, дурак!', 7, 'Алишер Моргенштерн прославился благодаря своему видеоблогу, в котором высмеивал русских рэперов, а позже даже записал альбом пародийного поп-панка. Но в этом релизе талант из Уфы впервые говорит от своего имени совершенно серьезно, призывая поверить в силу позитивного мышления. MORGENSHTERN делает все, чтобы поднять настроение слушателю: под карибские ритмы, забавные семплы и лиричные гитарные переборы воспевает радости жизни в своем мамбл-рэпе. Впрочем, есть в этой бочке меда и ложка дегтя — «Вечный сон» напоминает, что джунгли большого города могут стать депрессивным местом.');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Money - Single', 1, '');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('xx', 12, 'Сдержанный и изысканный дебютный альбом The xx произвел невероятный эффект. Мультижанровое звучание лондонской группы — смесь инди-попа, дабстепа и R&B — было по-настоящему свежим и смелым для 2009 года. Не прошло и нескольких лет, как эхо их особенного минимализма стало отзываться в самых разных записях из мира поп-музыки, R&B и хип-хопа. Так, в 2011-м семпл из «Intro» вошел в основу песни Rihanna «Drunk on Love», а Drake тогда же использовал фрагменты спродюсированной Jamie xx «I’ll Take Care of U» Гила Скотта-Херона в своем треке «Take Care». Часто подражаемая умеренность и доверительность альбома «xx» была не только сознательным выбором группы, но и следствием обстоятельств. Музыканты — Jamie xx (Джейми Смит), Роми Мэдли Крофт, Оливер Сим и вскоре покинувшая проект Бария Куреши — просто пытались сочинять песни, которые они могли бы исполнять вживую. «Люди спрашивали нас, почему наша музыка такая простая и минималистская, — рассказывает Мэдли Крофт в интервью Мэтту Уилкинсону для Apple Music. — Они думали, что мы действительно стремились к подобной эстетике. Но на самом деле мы хотели записать песни, которые смогли бы сыграть на сцене. То есть более простые, потому что мы только учились играть на инструментах».');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Bishop Briggs - EP', 6, '');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Pure Heroine', 10, 'В 2013-м имя Lorde не сходило с языка критиков и ценителей прогрессивной поп-музыки, впечатленных ее первым синглом «Royals». Этот революционный трек, сочетавший мечтательность дрим-попа с грандиозной мелодией и новаторской аранжировкой, принес уникальной певице «Грэмми». Дебютный альбом закрепил Lorde в статусе новой мировой звезды: он состоял из безупречных поп-хитов, проникнутых интеллектуальным духом независимой музыки.');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('take a number - Single', 1, '');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Light Me Up', 10, '');

INSERT INTO Songs.album (album_name, songs_number, descriptions)
VALUES ('Декоративно-прикладное искусство', 11, 'Альбом «Декоративно-прикладное искусство» — яркий результат взаимопонимания между музыкантами, которые получают огромное удовольствие от творчества. Название намекает на то, что Монеточка и Исаев затеяли игру со слушателем. Действительно, альбом представляет собой небольшую поп-энциклопедию — парад-алле музыкальных номеров, в которых угадываются отсылки к разным стилям прошлого века: от городского романса и блюза до рокабилли и хард-рока. «Когда мы с Лизой только начали что-то придумывать, перебрасываться идеями и шутками, первой у нас родилась „Рентгенограмма“, — рассказывает Витя Исаев. — Я туда вставил степ, и нам это понравилось. Потом предложил записать альбом в эстрадном стиле, сделать своеобразный поклон тем жанрам, которые стали забывать в современном мире». «Параллельно мы начали приглядываться к тому, как раньше выглядела эстрада, — добавляет Монеточка. — Какими были, например, Алла Пугачева и Филипп Киркоров до того, как стали нашими небожителями и мастодонтами. Они делали интереснейшие вещи. Как жаль, что сами они отказываются от своего прошлого. Пытаются делать рэп, тянутся к молодежи, а нам нравится то, что они делали раньше». Далее Лиза Монеточка и Витя Исаев рассказывают историю появления каждого трека с альбома «Декоративно-прикладное искусство».');

SELECT * FROM Songs.album;

------------------------------------------------------------------------------------------------------------------------

INSERT INTO Songs.genre (genre_name, descriptions) -- 1
VALUES ('Хип-хоп', 'музыкальный жанр популярной музыки, развитый в США афроамериканцами и латиноамериканцами, живущими в бедных районах[10] Бронкса в Нью-Йорке в 1970-х годах. Хип-хоп-музыка состоит из стилизованной ритмичной музыки, которая обычно сопровождается рэпом, ритмичной и рифмованной речью, которую произносят нараспев[11]. Хип-хоп-музыка развивалась как часть хип-хоп-культуры, субкультуры, определяемой четырьмя ключевыми стилистическими элементами: эмсиинг/исполнение рэпа, диджеинг/скретчинг с помощью виниловых проигрывателей, брейк-данс и рисование граффити. Другие элементы включают семплирование битов или басовых линий из записей (или синтезированных битов и звуков) и ритмичный битбокс.');

INSERT INTO Songs.genre (genre_name, descriptions) -- 3
VALUES ('Электроника', 'это одновременно широкая группа стилей электронной музыки, предназначенных скорее для прослушивания, чем непосредственно для танцев, и музыкальная сцена, которая появилась в начале 1990-х годов в Великобритании. В Соединённых Штатах этот термин в основном используется для обозначения электронной музыки в целом');

INSERT INTO Songs.genre (genre_name, descriptions) -- 4
VALUES ('Поп-музыка', 'область массовой культуры, охватывающая различные формы, жанры и стили развлекательной и прикладной музыки 2-й половины XX — начала XXI веков. Вид массовой культуры.
Основные черты поп-музыки — простота инструментальной части, ритмичность, акцент на вокал. Основная и практически единственная форма композиции в поп-музыке — песня.
Поп-музыка включает в себя такие поджанры, как европоп, латина, синтипоп, диско, танцевальная музыка и другие. ');

INSERT INTO Songs.genre (genre_name, descriptions) -- 5
VALUES ('Хард-рок', 'жанр рок-музыки, характеризующийся выделенной ролью ритм-секции, главным образом бас-гитары и ударных инструментов. Композиции этого жанра часто построены на риффах в фигурах с размером 4/4.
Хард-рок зародился в 1960-е годы, обрел привычные формы в конце 1960-х — начале 1970-х годов, а его расцвет пришёлся на начало 1970-х, при участии таких групп, как Led Zeppelin, Black Sabbath и Deep Purple. От хард-рока тут же ответвился хеви-метал, дав начало всей «металлической» музыке. Вторая его волна приходится на 1980-е годы (вслед за спадом популярности раннего панк-рока). ');

INSERT INTO Songs.genre (genre_name, descriptions) -- 6
VALUES ('R&B', 'Несмотря на то, что сокращение ар-н-би (англ. R&B) производит ассоциации с музыкой в стиле ритм-н-блюз, эта аббревиатура используется для определения более нового стиля афроамериканской музыки, появившегося после диско в 1980-х годах. Современный ар-н-би сочетает в себе элементы соула, фанка, танцевальной музыки и, в результате появления течения нью-джек-свинг в конце 1980-х годов, хип-хопа.
Некоторые источники определяют стиль ар-н-би, как современную городскую музыку (это название формата радио, которое вещает хип-хоп и современный ар-н-би). ');

INSERT INTO Songs.genre (genre_name, descriptions) -- 2
VALUES ('Альтернативная музыка', 'Это понятие отличается расплывчатостью и многовариантностью. В западной традиции, например, термин применятся к одному из направлений гитарного американского рока начала 1990-х годов. С другой стороны, под «альтернативной» понимают любую музыку, не укладывающуюся в параметры «классического авангарда»');

SELECT * FROM Songs.genre;

------------------------------------------------------------------------------------------------------------------------

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 1
VALUES ('Morgenshtern', 150,' российский рэп- и поп-исполнитель, музыкант, шоумен.
Первую известность получил в 2018 году благодаря пародиям на популярных музыкальных исполнителей того времени, которые публиковал на YouTube. В 2019 году отказался от данного формата и начал выпускать только авторские музыкальные релизы, построив свою дальнейшую карьеру исключительно на них. Творчеству исполнителя предшествуют различные пиар-акции, а его образ, перформансы и различные действия не раз становились объектом внимания СМИ, государственных деятелей и других[⇨].
Помимо своей музыкальной деятельности Моргенштерн является совладельцем ресторанов «Kaif Provenance» и «Kaif Burger», а также основателем интернет-СМИ в Telegram «Не Моргенштерн»[⇨]. ');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 2
VALUES ('Шарлот', 95, 'российский музыкант, певец и автор песен. Успех ему принесли кавер-версии композиций группы «Пошлая Молли». Юный певец выложил их в соцсетях, а лидер группы Кирилл Бледный сделал репост у себя, организовав парню нешуточный пиар. Многие другие исполнители также положительно отреагировали на стиль Шарлота, большинство из них предлагали самарскому музыканту записать что-либо в тандеме.
В 2017-м увидел свет первый EP Эдуарда «Это наш мир», в который вошло 6 треков. В марте 2018-м Шарлот выпустил EP «Ах, я счастлив», а чуть позже мини-альбом «Буду спать или нет?».
В 2018-2019 годах на Youtube появились клипы на песни Эдуарда Шарлота «Нити дев», «Ах, я счастлив» и «Щека на щеку».');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 3
VALUES ('The Weeknd', 250, 'канадский певец, автор песен и музыкальный продюсер эфиопского происхождения[3]. В конце 2010 года Тесфайе анонимно загрузил несколько песен на YouTube под именем «The Weeknd». На протяжении 2011 года он выпустил три микстейпа по 9 песен в каждом: House of Balloons, Thursday и Echoes of Silence, которые были одобрены критиками[4]. Год спустя он выпустил сборник Trilogy: тридцать треков, состоящих из ремастерованных версий микстейпового материала и трёх дополнительных песен. Альбом был выпущен на Republic Records и его собственном лейбле XO.
В 2013-м выпускает дебютный студийный альбом Kiss Land, в поддержку которого были выпущены синглы «Kiss Land» и «Live For». Его второй альбом получил название Beauty Behind the Madness и стал его первым альбомом, получившим первое место в чарте Billboard 200, включая вошедший в топ-5 сингл «Earned It» и попавшие на первое место синглы «The Hills» и «Can''t Feel My Face». Песни одновременно удерживали первые три места в чарте Billboard Hot R&B Songs, сделав его первым артистом в истории, добившимся этого[5]. Тесфайе выиграл две премии «Грэмми» и был номинирован на премию «Оскар»[6]. В сентябре 2016 года был анонсирован релиз третьего альбома под названием Starboy и выпущен заглавный сингл «Starboy», который впоследствии попал на первое место чарта Billboard Hot 100. Релиз альбома Starboy состоялся 25 ноября 2016 года[7]. Альбом дебютировал с первой строчки чарта Billboard 200, возглавил iTunes 80 стран, а также установил рекорд Spotify по количеству прослушиваний за сутки[8].
В 2017 году возглавляет рейтинг Forbes 30 самых высокооплачиваемых звёзд спорта и шоу-бизнеса моложе 30 лет. По данным издания, его годовой доход составляет 92 млн долларов[9].
20 марта 2020 года был выпущен его четвёртый студийный альбом «After Hours».
7 января 2022 года был выпущен его пятый студийный альбом «Dawn FM». Позднее исполнитель в своём блоге в Twitter намекнул на то, что два последних альбома являются частью новой трилогии[10]. ');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 4
VALUES ('Lana Del Rey', 250, 'американская певица, автор песен и поэтесса. Её музыка была отмечена критиками за кинематографический стиль, озабоченность трагическими отношениями и меланхолией, а также за отсылки к американской поп-культуре, в частности, 1950-х и 1960-х годов[8].
Дель Рей начала свою карьеру в 2005 году, но мировая известность пришла к ней после выпуска её дебютного сингла «Video Games» в 2011 году[9]. Дель Рей получила дальнейшее признание после выпуска своего второго студийного альбома Born to Die. В 2012 году французский диджей Седрик Жерве  (англ.)рус. выпустил ремикс на песню Дель Рей, «Summertime Sadness», дебютировавший с шестой позиции в чарте Billboard Hot 100. В ноябре 2012 года исполнительница выпустила мини-альбом Paradise, который был номинирован на американскую музыкальную премию Грэмми в номинации «Лучший вокальный поп-альбом»[10]. В 2013 году Дель Рей выпустила короткометражный фильм «Тропико», автором сценария, композитором и актёром которого она является[11].
В 2014 году Дель Рей выпустила свой третий студийный альбом, Ultraviolence, который получил положительный критический и коммерческий приём; альбом дебютировал с первой позиции в американском чарте. В течение мая и июня 2015 года Дель Рей выступала в рамках собственного концертного тура по Северной Америке, The Endless Summer Tour[12], после чего в сентябре того же года исполнительница выпустила четвёртый студийный альбом Honeymoon, получивший положительные отзывы и коммерческий успех[13]. 21 июля 2017 года был выпущен пятый студийный альбом исполнительницы, получивший название Lust for Life. Пластинка получила положительные отзывы от критиков, а также дебютировала с первой позиции в Billboard 200.
Шестой альбом певицы, Norman Fucking Rockwell! (2019), удостоился широкого признания критиков и был дважды номинирован на премию Грэмми, в том числе в категории «Альбом года». В 2019 году Дель Рей выпустила синглы «Doin’ Time» и «Don’t Call Me Angel», последний из которых записан совместно с Арианой Гранде и Майли Сайрус и вошёл к саундтрек к фильму «Ангелы Чарли» (2019)[14]. Позже Дель Рей выпустила альбомы Chemtrails Over the Country Club и Blue Banisters, оба в 2021 году. ');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 5
VALUES ('Ed Sheeran', 220, 'английский певец, автор песен, музыкант, звукозаписывающий продюсер, актёр и бизнесмен. Первый коммерческий успех пришёл к нему в июне 2011 года благодаря синглу «The A Team», занявшему третье место в британском чарте. Все его альбомы + (2011), × (2015), ÷ (2017) и No.6 Collaborations Project (2019)[1] занимали первые места в британском чарте, последние два также возглавляли американский чарт. Песня Ширана «Thinking Out Loud» принесла ему две премии «Грэмми» в 2016 году. В январе 2017 сингл «Shape of You» занял 1-е место по продажам в США и Великобритании. В 2019 году вошёл в список самых высокооплачиваемых музыкантов по версии журнала Forbes, заняв в нём третье место. Заработанная сумма составила 110 миллионов долларов');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 6
VALUES ('Billie Eilish', 150, 'американская певица и автор песен. Лауреат премии «Оскар» (2022) за песню «No Time to Die», написанную для фильма «Не время умирать» (2021). Снискала известность в 2015 году благодаря публикации дебютного сингла «Ocean Eyes» на SoundCloud. В 2019 году её дебютный альбом When We All Fall Asleep, Where Do We Go? возглавил американский (Billboard 200) и британский (UK Albums Chart) хит-парады, а сингл «Bad Guy» вышел на первое место в Billboard Hot 100 (США). Он стал первым чарттоппером певицы, а сама Айлиш благодаря этому достижению стала первым человеком, рождённым в XXI веке, которому удалось возглавить Hot 100[6].
В 2020 году Айлиш стала триумфатором музыкальной премии «Грэмми», выиграв все четыре основные номинации: «Песня года», «Альбом года», «Запись года» и «Лучший новый исполнитель», а также победив в номинации «Лучший вокальный поп-альбом»[7]. В результате она стала первым с 1981 года исполнителем (и лишь вторым в истории после Кристофера Кросса), получившим все четыре главных награды года[8][9]; в общей сложности певица является обладательницей семи премий «Грэмми» (по состоянию на 15 марта 2021 года).
Включена в список 100 наиболее влиятельных людей 2021 года по версии журнала Time в категории «Пионеры»');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 7
VALUES ('Big Baby Tape', 100, 'российский рэпер и автор песен. Создатель и негласный лидер музыкального объединения Benzo Gang[4]. Выступает также под псевдонимами DJ Tape («Ди́джей Тейп») и альтер-эго Tape LaFlare («Тейп Лафлэ́р»). Является исполнителем и по совместительству A&R лейбла Warner Music Russia. ');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 8
VALUES ('Kizaru', 120, 'российский и испанский хип-хоп-исполнитель родом из Санкт-Петербурга. Проживает в Барселоне. Участник и основатель творческого объединения «HAUNTED FAMILY».');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 9
VALUES ('ЛСП', 180, 'ЛСП – творческий псевдоним белорусского певца, рэпера и автора песен Олега Савченко. Это аббревиатура от английского «Lil’ Stupid Pig», что означает «маленькая глупая свинья». Творчество ЛСП любят за бережное отношение к тексту, который пестрит неожиданными литературными приемами.');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 10
VALUES ('Cardi B', 90, 'американская хип-хоп-исполнительница, автор песен, актриса и телезвезда[6]. Родилась и была воспитана в Бронксе, Нью-Йорк. Обрела популярность после публикаций юмористических скетчей в Vine и Instagram[7]. С 2015 по 2017 год была участницей реалити-шоу Love & Hip Hop: New Yorkruen на канале VH1, уже в то время увлекаясь музыкой. После завершения съемок выпускает два микстейпа — Gangsta Bitch Music, Vol. 1 и Vol. 2[8].
Карди Би трижды возглавляла чарт Billboard Hot 100. Её сингл «Bodak Yellow» удостоился звания «рэп-гимн лета» от газеты The New York Times[9] и сделал её второй рэпершей в истории, которой удалось попасть на вершину хит-парада с сольным треком, после Лорин Хилл, сделавшей это в 1998 году с песней «Doo Wop (That Thing)ruen». Другой сингл, «I Like It», сделал её единственной хип-хоп-исполнительницей, которой несколько раз удалось попасть на первую строчку чарта, а совместная композиция с Maroon 5 под названием «Girls Like You» сделала Карди Би шестой по счёту исполнительницей за всю историю существования главного песенного чарта США, которой трижды удалось попасть на его вершину с 2010 года[10]. Дебютный сольный альбом Карди Би, Invasion of Privacy, вышедший в 2018, сумел побить несколько стриминговых рекордов и получил три платиновые сертификации от RIAA. Получив удовлетворительные оценки от критиков, альбом выиграл Грэмми в номинации «Лучший рэп-альбом», делая Карди Би единственной женщиной, которой удалось выиграть в данной номинации с сольным альбомом[11]. Также, в 2018 году, журнал Time включил Карди в ежегодный список ста самых влиятельных людей мира[12].
Карди Би удалось выиграть семь статуэток премии Billboard Music Awards, девять статуэток церемонии BET Hip Hop Awards — больше, чем какая-либо другая хип-хоп-исполнительница, а также три от American Music Awards и MTV Video Music Awards, и установить два рекорда в Книге Гиннесса[13]. ');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 11
VALUES ('The xx', 220, ' британская инди-поп-группа, образовавшаяся в 2005 году в Лондоне. Дебютный альбом группы xx получил высокие оценки музыкальных критиков и был номинирован на Mercury Prize, которую в итоге и получил 7 сентября 2010 года');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 12
VALUES ('Bishop Briggs', 80, 'британская певица и композитор из Лос-Анджелеса, штат Калифорния. Получила широкую известность за свой сингл «River» Дебютный альбом Church of Scars вышел 20 апреля 2018 года');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 13
VALUES ('Lorde', 280, 'новозеландская певица, автор песен и музыкальный продюсер. Начав карьеру в 2009 году, Элла подписала контракт с лейблом Universal Music Group в подростковом возрасте, а позже начала работу над дебютным альбомом с продюсером Джоэлом Литтлом, который является соавтором большинства песен Лорд. Её первым успехом стал мини-альбом The Love Club EP, выпущенный в марте 2013 года и дебютировавший на второй позиции в чартах Австралии и Новой Зеландии.
В середине 2013 года Лорд выпустила дебютный сингл «Royals». Песня стала международным кроссовер-хитом и сделала Лорд самой молодой исполнительницей, и единственной новозеландкой, занявшей первую позицию в чарте Billboard Hot 100 с 1987 года. В конце 2013 года, Лорд выпустила свой дебютный студийный альбом Pure Heroine. Диск возглавил чарты Новой Зеландии и Австралии, также достигнув третьей позиции в американском чарте Billboard 200. В поддержку альбома были выпущены синглы «Tennis Court», «Team», «No Better» и «Glory and Gore». В 2014 году Лорд записала песню «Yellow Flicker Beat»  (англ.)рус., которая была выпущена в качестве сингла к саундтреку Голодные игры: Сойка-пересмешница. Часть 1  (англ.)рус.. В июне 2017 года состоялся релиз второго студийного альбома Лорд, Melodrama. Пластинка является самым высокооценённым критиками альбомом исполнительницы на 2017 год[2]. В поддержку диска были выпущены такие синглы, как «Green Light» и «Perfect Places».
Композиции Лорд записаны в дрим-поп и инди-электроника. Исполнительница имеет две премии Грэмми, одну BRIT Awards и десять премий New Zealand Music Awards  (англ.)рус.. В 2013 году журнал Time назвал Лорд одним из самых влиятельных подростков, а в следующем году она была включена в рейтинг журнала Forbes, «30 до 30». ');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 14
VALUES ('Marian Hill', 70, 'американский электронный дуэт, состоящий из Саманты Гонгол (вокал) и Джереми Ллойда (DJ). Название коллектива состоит из имен персонажей мюзикла The Music Man[en]: Марианы Пару англ. Marian Paroo и Гарольда Хилла англ. Гарольда Хилла
В 2013 году дуэт выпустил свой первый мини-альбом Play, записанный вместе с джазовым музыкантом Стивом Дэвитом. Спустя два года состоялся релиз второго EP, Sway. В сентябре 2015 года также состоялось первое выступление дуэта на телевидении, на The Late Late Show with James Corden[en]*. В 2017 году дуэт выпустил свой первый полноформатный альбом Act One, а в 2018 состоялся релиз второго — Unusual.
Музыка группы характеризуется минималистичным электронным звучанием с привнесением элементов R&B и поп-музыки');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 15
VALUES ('The Pretty Reckless', 130, 'рок-группа из Нью-Йорка, возглавляемая Тейлор Момсен.
Дебютный альбом группы, Light Me Up, был издан 30 августа 2010 года. Первый сингл «Make Me Wanna Die» вышел 13 мая 2010 года и занял первое место в UK Rock Chart. Релиз второго альбома, Going to Hell, состоялся 18 марта 2014 года, третьего — Who You Selling For — 21 октября 2016 года ');

INSERT INTO Songs.musician (musician_name, songs_number, descriptions) -- 16
VALUES ('Монеточка', 150, 'российская певица, музыкант, композитор и автор песен. Стала известна в 2016 году, когда начала выкладывать в Интернете песни, записанные дома под фортепиано[3]. Массовую популярность в России ей принёс альбом «Раскраски для взрослых», вышедший в 2018 году.');

SELECT * FROM Songs.musician;

------------------------------------------------------------------------------------------------------------------------

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (37, 'Малышка', '00:02:31', 4, 2020, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (38, 'Несокрушимые', '00:03:08', 4, 2020, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (39, 'Prisoner', '00:04:34', 6, 2015, 'Canada');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (39, 'Dark Times', '00:04:20', 6, 2015, 'Canada');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (40, 'Starboy', '00:03:59', 6, 2016, 'Canada');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (41, 'Shape of you', '00:03:53', 4, 2017, 'UK');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (42, 'Born to Die', '00:04:26', 2, 2012, 'USA');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (43, 'Bad guy', '00:03:14', 2, 2019, 'USA');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (43, '8', '00:02:53', 2, 2019, 'USA');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (44, 'Bandana', '00:02:31', 1, 2021, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (45, 'Surname', '00:02:37', 1, 2019, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (45, 'Brigada', '00:02:24', 1, 2019, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (46, 'OK', '00:03:05', 1, 2015, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (46, 'Безумие', '00:03:45', 1, 2015, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (47, 'зеленоглазые деффки!', '00:03:25', 1, 2018, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (48, 'Money', '00:03:03', 1, 2018, 'USA');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (49, 'Crystailized', '00:03:21', 2, 2009, 'UK');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (50, 'River', '00:03:36', 2, 2018, 'UK');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (51, 'Royals', '00:03:10', 2, 2013, 'New Zealand');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (52, 'take a number', '00:03:22', 3, 2019, 'USA');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (53, 'My Medicine', '00:03:13', 5, 2010, 'USA');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (54, 'Переживу', '00:03:25', 4, 2020, 'Russia');

INSERT INTO Songs.Song (album_id, song_name, song_time, genre_id, year, country)
VALUES (54, 'Рентгенограмма', '00:03:08', 4, 2020, 'Russia');

SELECT * FROM Songs.Song;

------------------------------------------------------------------------------------------------------------------------

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (1, 1);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (1, 2);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (2, 2);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (3, 3);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (4, 3);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (4, 5);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (5, 3);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (5, 4);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (6, 5);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (7, 4);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (8, 6);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (9, 6);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (10, 7);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (10, 8);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (11, 7);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (12, 7);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (13, 9);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (14, 9);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (15, 9);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (15, 1);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (16, 10);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (17, 11);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (18, 12);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (19, 13);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (20, 14);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (21, 15);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (22, 16);

INSERT INTO Songs.ID_keys_musician (song_id, musician_id)
VALUES (23, 16);

select * from Songs.ID_keys_musician;

------------------------------------------------------------------------------------------------------------------------

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (1, 'https://www.youtube.com/watch?v=jPQQBB8aB_M', 'ЛЮБИ.');

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (3, 'https://www.youtube.com/watch?v=34Na4j8AVgA', 'Taken from the new album Starboy
http://theweeknd.co/StarboyYD ');

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (6, 'https://www.youtube.com/watch?v=JGwWNGJdvx8', 'The official music video for Ed Sheeran - Shape Of You
The new album "=" is out now - listen here: https://es.lnk.to/equals');

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (8, 'https://www.youtube.com/watch?v=DyDfgMOUjCI', 'Listen to "bad guy" from the debut album "WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?", out now: http://smarturl.it/BILLIEALBUM');

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (13, 'https://www.youtube.com/watch?v=0dkHzLOmdDU', 'Подписаться на канал: https://goo.gl/Pzs7Lx
Билеты на концерты ЛСП: https://lsp.show/');

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (16, 'https://www.youtube.com/watch?v=zUOh09GoQgk', 'Cardi B - Money
Stream/Download: https://CardiB.lnk.to/moneyID');

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (18, 'https://www.youtube.com/watch?v=h5jz8xdpR0M', 'CHAMPION: THE ALBUM OUT NOW: https://BishopBriggs.lnk.to/CHAMPIONA...
Follow Bishop Briggs: ');

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (19, 'https://www.youtube.com/watch?v=nlcIKh6sBtc', 'Music video by Lorde performing Royals. (C) 2013 Universal Music NZ Ltd.
Get Lorde’s Pure Heroine album here: https://Lorde.lnk.to/PureHeroineID');

INSERT INTO Songs.songs_music_video (song_id, reference, descriptions)
VALUES (20, 'https://www.youtube.com/watch?v=2X7Q0d82rPs', '"oOo that''s my type" (feat. Yung Baby Tate) available now: https://marianhill.lnk.to/oOothatsmytype
LISTEN NOW: https://geni.us/take-a-number');

select * from Songs.songs_music_video;

------------------------------------------------------------------------------------------------------------------------

INSERT INTO Songs.TOP_charts (song_id, place_song, comments_about_song)
VALUES (20, 1, 'I’m waiting for them to get super big, but I also want them to be kept lowkey.');

INSERT INTO Songs.TOP_charts (song_id, place_song, comments_about_song)
VALUES (22, 2, 'Прекрасная песня и очень красивая отсылка к "''Til I Die" The Beach Boys');

INSERT INTO Songs.TOP_charts (song_id, place_song, comments_about_song)
VALUES (18, 3, 'I could listen to this song 10000 times and still never get tired of it. I just finished Meteor Garden and I''m so happy they used this song! It was a perfect choice!');

INSERT INTO Songs.TOP_charts (song_id, place_song, comments_about_song)
VALUES (10, 4, 'Поставила 99 Problems на будильник и наследуйщий день проснулась в дед доме');

INSERT INTO Songs.TOP_charts (song_id, place_song, comments_about_song)
VALUES (4, 5, 'I used to love this song so much. Loving the vibes.');

select * from Songs.TOP_charts;
