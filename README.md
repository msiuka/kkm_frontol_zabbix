# Мониторинг и сбор информации из Frontol5 в Zabbix для windows машин.
Скрипты и конфиг zabbix_agent для запуска на машине с установленным Frontol5. Шаблон для zabbix сервера версии 4.2.
Используется информация из файла OfdState, куда сам Frontol сохраняет информацию о ККМ. Нет необходимости общаться с ФР по сети, но из-за зоопарка машин приходится еще держать списки путей ofdstatepaths.txt до OfdState  
##### Собирает:
- Версии установленных Frontol
- Возраст буфера и срок действия фискального накопителя
- Количество неотправленных чеков
- Модель и серийный номер ККМ

##### Мониторит:
- Актуальность версии Frontol (В шаблоне используется макрос {$FRONTOL_VERSION} с текущей актуальной версией. Удобно использовать при обновлении, когда срабатывает триггер и видно какие еще кассовые ПК необходимо обновить)
- Отправку чеков в ОФД
- Необходимость замены ФН (За 30 дней срабатывает триггер и оповещает нас об этом)
- Замены ФР
