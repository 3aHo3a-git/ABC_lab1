
cd ~
mkdir lab0
cd lab0
mkdir claude_monet
cd claude_monet
mkdir kitchen
mkdir hall
mkdir bar
mkdir office
mkdir locker_room
cd kitchen
mkdir hot_station
mkdir pastry_station
touch barinov_order
echo "Баринов собирает всю команду перед сменой
Каждый повар отвечает за своё рабочее место
Лёва контролирует выдачу блюд" > barinov_order
cd hot_station
touch senya_task
echo "Сеня готовит мясо для банкета
Проверяет температуру горячего цеха
После смены считает оставшиеся продукты" > senya_task
touch fedya_task
echo "Федя разделывает рыбу для гостей
Готовит фирменную закуску вместе с Сеней
Перед подачей зовёт Баринова" > fedya_task
cd ..
cd pastry_station
touch lui_dessert
echo "Луи выпекает коржи для мильфея
Готовит крем по старому рецепту
Оставляет один десерт для команды" > lui_dessert
touch katya_idea
echo "Катя предлагает новый шоколадный десерт
Баринов просит уменьшить количество сахара
Пробную порцию получает Макс" > katya_idea
cd ..
cd ..
cd hall
touch waiter_plan
echo "Настя обслуживает столики у окна
Официанты встречают гостей в главном зале
Особые просьбы гостей передают Вике" > waiter_plan
cd ..
cd bar
touch kostya_report
echo "Костя проверил запас напитков
Для вечера подготовлены новые коктейли
Бар откроется одновременно с залом" > kostya_report
touch nastya_note
echo "Настя просит Костю не опаздывать
После смены они ужинают вместе
Для гостей оставлены чистые бокалы" > nastya_note
cd ..
cd office
touch vika_summary
echo "Вика проверила кухню и главный зал
Команда готова к вечерней смене
Отчёт нужно передать Нагиеву" > vika_summary
cd ..
cd locker_room
touch max_note
echo "Макс придумал новое блюдо для меню
Баринов разрешил приготовить пробную порцию
Вика ждёт Макса после смены" > max_note
touch leva_note
echo "Лёва проверяет форму новых поваров
Ключ от кладовой лежит у шефа
Последним кухню закрывает су-шеф" > leva_note
cd ..
cd ..
chmod 755 claude_monet
cd claude_monet
chmod u=rwx,g=rx,o= kitchen
cd kitchen
chmod 750 hot_station
cd hot_station
chmod u=rw,g=r,o= senya_task
chmod 640 fedya_task
cd ..
chmod u=rwx,g=rx,o= pastry_station
cd pastry_station
chmod 644 lui_dessert
chmod u=rw,g=r,o=r katya_idea
cd ..
chmod 640 barinov_order
cd ..
chmod u=rwx,g=rx,o= hall
cd hall
chmod 644 waiter_plan
cd ..
chmod 750 bar
cd bar
chmod u=rw,g=r,o= kostya_report
chmod 640 nastya_note
cd ..
chmod u=rwx,g=rx,o= office
cd office
chmod 640 vika_summary
cd ..
chmod 750 locker_room
cd locker_room
chmod u=rw,g=r,o= max_note
chmod 644 leva_note
cd ~/lab0
cp claude_monet/locker_room/max_note claude_monet/office/max_report
cp -r claude_monet/bar claude_monet/hall/bar_backup
ln -s claude_monet/kitchen/barinov_order final_menu
ln -s ../kitchen claude_monet/office/kitchen_access
ln claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/senya_task_copy
cat claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/fedya_task > claude_monet/kitchen/cook_tasks
cat claude_monet/hall/waiter_plan >> claude_monet/office/vika_summary
mv claude_monet/locker_room/max_note claude_monet/kitchen/max_final_note
cd ..
ls -lR lab0 | grep "^-" | sort -nr -k 5 | head -n 5
grep -irh -e "баринов" -e "макс" lab0/claude_monet | grep -v "порц" | sort | head -n 6
cd lab0
grep -rl -e "кост" -e "наст" claude_monet/bar claude_monet/hall/bar_backup | wc -l
(head -q -n 1 claude_monet/kitchen/hot_station/*_task; tail -q -n 1 claude_monet/kitchen/hot_station/*_task) | grep -iE "сеня|федя|продукт" | sort -r
grep -v -e "Сеня" -e "Федя" claude_monet/kitchen/cook_tasks | sort -r | head -n 4 | wc -w
cd ..
ls -lRi lab0 | grep -E "^ *[0-9]+ +-[^ ]+ +2 " | sort -n -k 1
ls -lR lab0 | grep "^l" | grep -v "final" | sort -k 9
cd lab0
rm claude_monet/office/max_report
rm final_menu
rm claude_monet/office/kitchen_access
rm claude_monet/kitchen/hot_station/senya_task_copy
rm claude_monet/locker_room/leva_note
rmdir claude_monet/locker_room
rm claude_monet/kitchen/max_final_note
rm -rf claude_monet/hall/bar_backup
