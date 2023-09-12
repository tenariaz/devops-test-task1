**Тестове завдання на посаду DevOps Engineer**

**Опис послуги**

Компанія планує надати користувачам корисний REST API, доступ до якого можна отримати в наступних точках входу:

- /
- /ring-ring

і в результаті отримати унікальний документ JSON.

Щоб продемонструвати користувачам можливості API, дизайнер компанії створив landing  page app/index.html. Сторінка містить опис сервісу та результат доступу до однієї з точок входу, отриманих за запитом AJAX.

**Інфраструктура**

Компанія хоче, щоб сервіс був відмовостійким і продуктивним. Після інтенсивного мозкового штурму була розроблена схема, що складається з двох серверів API, балансувальника навантаження, сервера моніторингу та веб-сервера, з якого користувачі матимуть доступ до посадкової сторінки.

![Логічна схема послуги](https://github.com/DominicMagnus/devops-test-task/raw/main/diagram.png)


Компанія висунула наступні вимоги до інфраструктури:

- В якості серверів використовуються віртуальні машини, створені на Amazon [EC2](https://aws.amazon.com/ec2) з образів Amazon Linux AMI 2017.03.1 або Ubuntu Server 16.04 LTS. Інженер надасть команді системних адміністраторів SSH доступ до віртуальних машин.
- Для зручної доставки користувачам нових версій API було вирішено використовувати [Docker](https://www.docker.com) як засіб віртуалізації та ізоляції запущених екземплярів додатків. Інженеру доведеться:
  - Опишіть конфігураційний докерфайл програми на основі образу [Node.js](https://hub.docker.com/_/node).
  - налаштувати автоматичну збірку образу при оновленні вихідного коду програми засобами [GitLab CI](https://about.gitlab.com/features/gitlab-ci-cd), і опублікувати зображення в загальнодоступному сховищі на [hub.docker.com](https://hub.docker.com);
  - реалізувати автоматизовану доставку нових версій API на сервери (якщо буде реалізовано розгортання без простоїв, інженер отримає додатковий тиждень відпустки).
- в разі повного виходу з ладу одного з серверів або збою в роботі додатку API сервіс повинен залишатися доступним. Вони вирішили вважати заявку невдалою як перевищення тайм-ауту відповіді в 2 секунди або відповідь  з 50-кратним HTTP-кодом з будь-якої точки входу. Запити до API повинні бути збалансовані за алгоритмом Round Robin (якщо застосувати алгоритм Less Connections, інженер отримає довгоочікувану надбавку до зарплати).
- Користувачі API можуть безпосередньо отримати доступ до балансувальника навантаження через точки входу, надані в API;
- Користувачам сервісу доступна посадкова сторінка, розміщена на окремому сервері. Компанія хоче використовувати [Apache](https://httpd.apache.org) або [nginx як веб-сервер. ](https://www.nginx.com/resources/wiki)Проксі запитів до балансувальника навантаження будуть налаштовані на веб-сервері для коректної роботи прикладу доступу до API на посадковій сторінці.
- Адміністраторам доступний веб-інтерфейс для моніторингу важливих (на думку інженера) метрик екземплярів API додатків, балансувальник навантаження, веб-сервер з посадковою сторінкою. [Prometheus](https://prometheus.io) або будь-яке подібне рішення використовується в якості сервісу моніторингу.

**Результат**

Результатом виконання завдання буде:

1. Повністю функціонуючий стек, який відповідає вищезазначеній логіці і враховує всі вимоги специфікації;
1. Набір скриптів і конфігураційних файлів, використовуючи які можна розгорнути подібний стек на порожніх серверах. Код, що реалізує інфраструктуру, знаходиться в окремій гілці форку  репозиторію [prog13/devops-test-task ](https://gitlab.com/prog13/devops-test-task.git) і для нього створено злиття-запит;
1. Приділяється увага питанню зберігання конфіденційної інформації - сховище не повинно містити ніяких ключів, токенів, паролів і т.д.
1. наявність облікових даних (ключів) для SSH доступу до всіх ресурсів стека;

**Термін виконання**

Компанія виділила один двотижневий спринт для виконання завдання.

