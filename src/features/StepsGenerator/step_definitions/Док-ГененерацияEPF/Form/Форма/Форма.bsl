﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;


&НаКлиенте
Перем ТекКолТаймер,МаксКолТаймер;

&НаКлиенте
// Служебная функция.
Функция ДобавитьШагВМассивТестов(МассивТестов,Снипет,ИмяПроцедуры,ПредставлениеТеста = Неопределено,Транзакция = Неопределено,Параметр = Неопределено)
	Структура = Новый Структура;
	Структура.Вставить("Снипет",Снипет);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ПредставлениеТеста",ПредставлениеТеста);
	Структура.Вставить("Транзакция",Транзакция);
	Структура.Вставить("Параметр",Параметр);
	МассивТестов.Добавить(Структура);
КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	ДобавитьШагВМассивТестов(ВсеТесты,"ЯУбедилсяЧтоСлужебныйEPFДляПроверкиГенерацииEPFУдален()","ЯУбедилсяЧтоСлужебныйEPFДляПроверкиГенерацииEPFУдален","Дано Я убедился что служебный EPF для проверки генерации EPF удален");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВКаталогеПоявиласьОбработка(Парам01)","ВКаталогеПоявиласьОбработка","И     В каталоге появилась обработка ""Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗапускаюКонфигураторСлужебнойБазы()","ЯЗапускаюКонфигураторСлужебнойБазы","Тогда я запускаю конфигуратор служебной базы");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюВКонфигуратореФайл(Парам01)","ЯОткрываюВКонфигуратореФайл","И я открываю в конфигураторе файл ""Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюОсновнуюФормуОбработки()","ЯОткрываюОсновнуюФормуОбработки","И я открываю основную форму обработки");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯПерехожуНаЗакладкуМодуль()","ЯПерехожуНаЗакладкуМодуль","И я перехожу на закладку Модуль");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯСворачиваюОбластьСлужебныеФункции()","ЯСворачиваюОбластьСлужебныеФункции","И я сворачиваю область Служебные функции");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯПерехожуКПроцедуре(Парам01)","ЯПерехожуКПроцедуре","И я перехожу к процедуре ""ЯУказалПервоеСлагаемое""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыделяюВТекстеСтрок(Парам01)","ЯВыделяюВТекстеСтрок","И я выделяю в тексте 9 строк");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗакрываюКонфигураторСлужебнойБазы()","ЯЗакрываюКонфигураторСлужебнойБазы","И я закрываю конфигуратор служебной базы");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	ИмяEPF = Контекст.ИмяEPF;
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяEPF) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяEPF);
	КонецЕсли;	 
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////


&НаКлиенте
//Дано Я убедился что служебный EPF для проверки генерации EPF удален
//@ЯУбедилсяЧтоСлужебныйEPFДляПроверкиГенерацииEPFУдален()
Процедура ЯУбедилсяЧтоСлужебныйEPFДляПроверкиГенерацииEPFУдален() Экспорт
	ИмяEPF = Ванесса.Объект.КаталогИнструментов + "\features\Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf";
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяEPF) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяEPF);
	КонецЕсли;	 
	
	Контекст.Вставить("ИмяEPF",ИмяEPF);
КонецПроцедуры

&НаКлиенте
Процедура Таймер() Экспорт
	ТекКолТаймер = ТекКолТаймер + 1;
	Если ТекКолТаймер > МаксКолТаймер Тогда
		ОтключитьОбработчикОжидания("Таймер");
		ВызватьИсключение "Файл <" + Контекст.ИмяEPF + "> не найден!";
	КонецЕсли;	 
	
	Если Ванесса.ФайлСуществуетКомандаСистемы(Контекст.ИмяEPF) Тогда
		ОтключитьОбработчикОжидания("Таймер");
		Ванесса.ПродолжитьВыполнениеШагов();
	КонецЕсли;	 
	
КонецПроцедуры

&НаКлиенте
//И     В каталоге появилась обработка "Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf"
//@ВКаталогеПоявиласьОбработка(Парам01)
Процедура ВКаталогеПоявиласьОбработка(Парам01) Экспорт
	ТекКолТаймер  = 0;
	МаксКолТаймер = 20;
	Ванесса.ЗапретитьВыполнениеШагов();
	ПодключитьОбработчикОжидания("Таймер",1,Ложь);
КонецПроцедуры

&НаКлиенте
//Тогда я запускаю конфигуратор служебной базы
//@ЯЗапускаюКонфигураторСлужебнойБазы()
Процедура ЯЗапускаюКонфигураторСлужебнойБазы() Экспорт
	ИмяФайла = Ванесса.Объект.КаталогИнструментов + "\tools\ServiceBases\v83ServiceBase\1Cv8.1CD";
	Если НЕ Ванесса.ФайлСуществуетКомандаСистемы(ИмяФайла) Тогда
		ИмяВременногоBat = ПолучитьИмяВременногоФайла("bat");
		
		ЗТ = Новый ЗаписьТекста(ИмяВременногоBat,"UTF-8",,Истина); 
		ЗТ.ЗаписатьСтроку("cd " + Ванесса.Объект.КаталогИнструментов); 
		ЗТ.ЗаписатьСтроку("oscript " + Ванесса.Объект.КаталогИнструментов + "\tools\onescript\build-service-conf.os"); 
		ЗТ.Закрыть();
		
		
		
		Команда = ИмяВременногоBat;
		Статус = Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(Команда);
		Если Статус <> 0 Тогда
			ВызватьИсключение "Не смог создать сервисные базы! Статус="+Статус; 
		КонецЕсли;	 
	КонецЕсли;	 
	
	
	СисИнфо = Новый СистемнаяИнформация; 
	ВерсияПриложения = СисИнфо.ВерсияПриложения;
	ПутьК1С = "C:\Program Files (x86)\1cv8\" + ВерсияПриложения + "\bin\1cv8.exe";
	СтрокаЗапускаКонфигуратора = """" + ПутьК1С + """ Designer /F""" + Ванесса.Объект.КаталогИнструментов + "\tools\ServiceBases\v83ServiceBase""";
	Статус = Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(СтрокаЗапускаКонфигуратора,0);//не ждём окончания работы конфигуратора
	Если Статус <> 0 Тогда
		ВызватьИсключение "Не смог запустить конфигуратор! СтрокаЗапускаКонфигуратора=<"+СтрокаЗапускаКонфигуратора+">"; 
	КонецЕсли;	 
	
	Ванесса.sleep(2);
	
	Статус = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\ConfiguratorIsOpen.sikuli""");
	Если Статус <> 0 Тогда
		ВызватьИсключение "Не смог найти открытый конфигуратор!"; 
	КонецЕсли;	 
	
КонецПроцедуры

&НаКлиенте
//И я открываю в конфигураторе файл "Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf"
//@ЯОткрываюВКонфигуратореФайл(Парам01)
Процедура ЯОткрываюВКонфигуратореФайл(ИмяФайла) Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\OpenDialogConf.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <OpenDialogConf>");
	
	//Ванесса.СделатьДействияПриЗаписиИнструкции("толькоскриншот");
	
	Ванесса.Шаг("И я набираю текст ""#enter""");
	//Ванесса.sleep(2);
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\OpenDialogClick.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <OpenDialogClick>");
	
	Путь = Ванесса.Объект.КаталогИнструментов + "\Features\" + ИмяФайла;
	
	Ванесса.Шаг("И я набираю текст""" + Путь + """");
	
	Ванесса.СделатьДействияПриЗаписиИнструкции();
	Ванесса.Шаг("И я набираю текст ""#enter""");
	
КонецПроцедуры

&НаКлиенте
//И я открываю основную форму обработки
//@ЯОткрываюОсновнуюФормуОбработки()
Процедура ЯОткрываюОсновнуюФормуОбработки() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\OpenMainFormOfEPF.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <OpenMainFormOfEPF>");
КонецПроцедуры

&НаКлиенте
//И я перехожу на закладку Модуль
//@ЯПерехожуНаЗакладкуМодуль()
Процедура ЯПерехожуНаЗакладкуМодуль() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\GoToFormModule.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <GoToFormModule>");
КонецПроцедуры

&НаКлиенте
//И я сворачиваю область Служебные функции
//@ЯСворачиваюОбластьСлужебныеФункции()
Процедура ЯСворачиваюОбластьСлужебныеФункции() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\CollapseServiceArea.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <CollapseServiceArea>");
КонецПроцедуры

&НаКлиенте
//И я закрываю конфигуратор служебной базы
//@ЯЗакрываюКонфигураторСлужебнойБазы()
Процедура ЯЗакрываюКонфигураторСлужебнойБазы() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\CloseConfigurator.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <CloseConfigurator>");
КонецПроцедуры

&НаКлиенте
//И я перехожу к процедуре "ЯУказалПервоеСлагаемое"
//@ЯПерехожуКПроцедуре(Парам01)
Процедура ЯПерехожуКПроцедуре(ИмяПроцедуры,Тип = "Процедура") Экспорт
	ИмяФайла = ПолучитьИмяВременногоФайла("txt");
	ЗТ = Новый ЗаписьТекста(ИмяФайла,"UTF-8",,Истина); 
	ЗТ.Записать(Тип + " " + ИмяПроцедуры); 
	ЗТ.Закрыть();
	
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\GoToProcedure.sikuli " + ИмяФайла);
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <GoToProcedure>");
КонецПроцедуры

&НаКлиенте
//И я выделяю в тексте 9 строк
//@ЯВыделяюВТекстеСтрок(Парам01)
Процедура ЯВыделяюВТекстеСтрок(КолСтрок) Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\SelectStringsInText.sikuli " + КолСтрок);
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <SelectStringsInText>");
КонецПроцедуры
