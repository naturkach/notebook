в команде PowerShell имена параметров всегда начинаются с дефиса.

grep in powershell:
     > Get-CIMInstance Win32_OperatingSystem | gm | Select-String -Pattern mem
	 
ls | grep "exe$"
	Get-ChildItem -path * -Include [A-Z].txt
 
 
	 
write jast value(string) not an object (-ExpandProperty) 
    > $test = Get-WmiObject win32_processor | Select-Object -ExpandProperty name
	
передача параметров в скрипт:
1.	[string]$str = $args[0]
	

2. Использовать Param Statement:
Первой исполняемой строкой в скрипте должна быть:
param([type]$p1 = , [type]$p2 = , ...)

---- Начало скрипта foo.ps1 ----
param([string]$foo = "foo", [string]$bar = "bar")
Write-Host "Аргумент: $foo"
Write-Host "Аргумент: $bar"
----  Конец скрипта foo.ps1  ----
 
Запуск скрипта - foo.ps1 с параметрами
PS C:\> .\foo.ps1 -foo "foo" -bar "bar"
Аргумент: foo
Аргумент: bar
-----------------	
  
получить методы класса ([math]):
	[math] | Get-Member -Static
	
поличить тип переменной:
	get-member -inputobject $myvar
	
получить константу PI:	
	[math]::PI 
	
$myvar.GetType() - get type of var
$myvar|gm = get all methods

get-command - все команды
$(get-command).length - сколько всего есть команд?
get-command -name "*-item" - найти все команды по шаблону (wildcard)

remove-item test.txt - удалить файл test.txt

get-alias -name "dir" - смотрим по алиасу какая комманда за ним стоит

command alias:
new-alias -name get-message -value getmessage2  - создаст алиас get-message для функции get-message2

удалить алиас/функцию:
remove-item -path "function:\get-message2"

создать функцию:
function get-message { return "test msg"}      
get-command -name get-message*  -- найдем наши команды/функции по  шаблону имени

----
 Если не указывать путь, PowerShell использует следующий порядок приоритета при запуске команд:

    1. Псевдоним или alias
    2. Функция или function
    3. Командлет
    4. Собственные команды Windows
	
	Например, если ввести «help», PowerShell сначала ищет псевдоним с именем help, затем функцию с именем help и, наконец, командлет с именем help.
----

Get-ExecutionPolicy -List
Get-ExecutionPolicy - view current
----
$number = 3 
$number +=3
$number // output 6

[string]$number = 3
$number +2
$number //output 32

$number.gettype() //get type of $number
----
необязательные элементы заключены в квадратные скобки [].
значение параметра - это входные данные, которые принимает параметр и на синтаксической диаграмме заключены в угловые скобки <>.
----

ARRAY

$newarr = 1,2,3,4
[int]$arr = 1,2,3,4 = строго типизированый масив

$array += "newval" = создаст новый масив больше го размера, присвоит туда значение старого и добавит новре значение

$array = @((1,2,3,4),(5,6,7,8))  = многомерный массив
$array[1][2]  = 7
$array[1][-2] = 7
$array[0][1..3] = 2,3,4

Хеш-таблица, также известная как словарь или ассоциативный массив
$hashtable = @{"dog" = "bark"; "cat" = "meow"}

$hashtable = [ordered]@{"dog" = "bark"; "cat" = "meow"}  // сохранить последовательность - сменит тип объекта на ordereddictionary

$hashtable = @{}   //create empty hash table 
$hashtable.Add("dog", "bark")  // add key-value pair

получить значение по ключу 
$hashtable.dog
$hashtable["dog"]
$hashtable."dog"
$($countrycodes.getenumerator())[1]  - получить 2-й элемент хеш таблицы
------
======
class

class Device {
    [string]$Brand
}

$dev = [Device]::new()
$dev.Brand = "Microsoft"
$dev

======
strings

$string = "hello"
$string = [string]"hello"


split
"helllo world test"  -split ' ' // разделяем пробелом, получим масив 
"helllo world test".Split(' ')

Substring - разделение
"helllo world test".Substring(3) - получим lo world test
"helllo world test".Substring(6,10) - получим world
"helllo world test" -replace "helllo", "hello"
"helllo world test".Replace("helllo", "hello")
"helllo world test" -replace "helllo", $null - вырезать слово
--------

операторы
PowerShell обладает также набором специальных операторов, которые не вписываются ни в одну группу операторов. 
() оператор переопределения приоритета (). Этот оператор работает как и арифметический смысл круглых скобок и запускает или переропределяет последовательность выполнения команд. 
$() Оператор Subexpression $() как и оператор приоритета возвращает результат одной или нескольких команд, но в скриптах это интерпретируется как переменная. 
@() Оператор массива @() возвращает результат в виде массива. 
@{} оператор хеш-таблицы @{}. 
[]  Оператор приведения типов [] преобразует или объявляет объекты указанным типом. 
::  Оператор статических членов объекта :: вызывает статические свойств и методы класса .NET Framework. 
&   Оператор вызова & запускает команду, скрипт или блок скриптов, при этом оператор вызова выполняется в дочерней области видимости. Это значит что скрипт, команада и т.д. принемает, но не возвращает значения переменных/функций и т.д. 
.   Оператор точка также запускает команду, скрипт или блок скриптов, но уже в текущей области видимости, что значит что скрипт, команда и т.д. принемает и возвращает значения переменных/функций и т.д. 
..  Оператор диапазона .. представляет последовательные целые числа в виде массива целых чисел. Начиная с PowerShell 6, оператор диапазона работает также и с символами, возвращая массив символов в алфовитном порядке.
---------

Запись в файл:

"some text" | Add-Content -Path .\filename.ps1 = add text to file
ls | Out-File .\some text.txt
$(@{"ps4" = "1000"; "ps5" = "1220"}).Keys | Set-Content .\file.txt

-------
	