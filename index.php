<?php

session_start();

if (!isset($_SESSION['logged_in'])) {
    $nav = 'includes/nav.php';
} else {
    $nav = 'includes/navconnected.php';
    $idsess = $_SESSION['id'];
}

require 'includes/header.php';
require $nav; ?>

<style>
    .autocomplete {
        /*the container must be positioned relative:*/
        position: relative;
        display: block;

    }

    .autocomplete-items {
        color: #26a69a;
        font: 16px Roboto, sans-serif;
        position: absolute;
        border: 1px solid #d4d4d4;
        border-bottom: none;
        border-top: none;
        z-index: 99;
        /*position the autocomplete items to be the same width as the container:*/
        top: 100%;
        left: 0;
        right: 0;
    }

    .autocomplete-items div {
        padding-bottom: 20px;
        padding-top: 20px;
        padding-left: 30px;
        cursor: pointer;
        background-color: #fff;
    }

    .autocomplete-items div:hover {
        /*when hovering an item:*/
        color: #26a69a;
        background-color: #e9e9e9;
    }

    .autocomplete-active {
        /*when navigating through the items using the arrow keys:*/
        background-color: DodgerBlue !important;
        color: #ffffff;
    }
</style>

<div class="container-fluid home" id="top" style="margin-bottom: 80px;">
    <div class="container search">
        <nav class="animated slideInUp wow">
            <div class="nav-wrapper">
                <form method="GET" action="search.php">
                    <div class="input-field">
                        <input id="search" class="searching" type="search" name='searched' required>
                        <label for="search"><i class="material-icons">search</i></label>
                    </div>

                    <div class="center-align">
                        <button type="submit" id="search1" name="search"
                            class="blue waves-light miaw waves-effect btn hide">Поиск</button>
                    </div>
                </form>
            </div>
        </nav>
    </div>
</div>

<div class="container most">
    <h2>Популярные предметы</h2>
    <div class="row">
        <?php

        include 'db.php';

        // заказанные товары в наибольшем количестве
        $queryfirst = "SELECT
    product.id as 'id',
    product.name as 'name',
    product.price as 'price',
    product.thumbnail as 'thumbnail',
    
    SUM(command.quantity) as 'total',
    command.statut,
    command.id_product
    
    FROM product, command
    WHERE product.id = command.id_product AND command.statut = 'paid'
    GROUP BY product.id
    ORDER BY SUM(command.quantity) DESC LIMIT 6";
        $resultfirst = $connection->query($queryfirst);
        if ($resultfirst->num_rows > 0) {
            // output data of each row
            while ($rowfirst = $resultfirst->fetch_assoc()) {

                $id_best = $rowfirst['id'];
                $name_best = $rowfirst['name'];
                $price_best = $rowfirst['price'];
                $thumbnail_best = $rowfirst['thumbnail'];
                $totalsold = $rowfirst['total'];

                ?>

                <div class="col s12 m4">
                    <div class="card hoverable animated slideInUp wow">
                        <div class="card-image">
                            <a href="product.php?id=<?= $id_best; ?>"><img height="250px"
                                    src="products/<?= $thumbnail_best; ?>"></a>

                            <a href="product.php?id=<?= $id_best; ?>"
                                class="btn-floating blue halfway-fab waves-effect waves-light right"><i
                                    class="material-icons">add</i></a>
                        </div>
                        <div class="card-content">
                            <div class="container">
                                <span class="card-title white-text">
                                    <?= $name_best; ?>
                                </span>
                                <div class="row">
                                    <div class="col s6">
                                        <p class="white-text"><i class="left fa fa-dollar"></i>
                                            <?= $price_best; ?>
                                        </p>
                                    </div>
                                    <div class="col s6">
                                        <p class="white-text"><i class="left fa fa-shopping-basket"></i>
                                            <?= $totalsold; ?>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            <?php }
        } ?>


    </div>
</div>

<div class="container-fluid center-align categories">
    <a href="category.php?id=all" class="button-rounded btn-large waves-effect waves-light">Категории</a>
    <div class="container" id="category">
        <div class="row">
            <?php

            //get categories
            $querycategory = "SELECT id, name FROM category";
            $total = $connection->query($querycategory);
            if ($total->num_rows > 0) {
                // output data of each row
                while ($rowcategory = $total->fetch_assoc()) {
                    $id_category = $rowcategory['id'];
                    $name_category = $rowcategory['name'];


                    ?>

                    <div class="col s12 m4">
                        <div class="card hoverable animated slideInUp wow">
                            <div class="card">
                                <a href="category.php?id=<?= $id_category; ?>"><span class="card-title black-text">
                                        <?= $name_category; ?>
                                    </span></a>

                            </div>
                        </div>
                    </div>

                <?php }
            } ?>
        </div>
    </div>
</div>


<div class="container-fluid about" id="about">
    <div class="container">
        <div class="row">
            <div class="col s12 m6">
                <div class="card animated slideInUp wow">
                    <div class="card-image">
                        <img src="src/img/about.jpg" alt="">
                    </div>
                </div>
            </div>

            <div class="col s12 m6">
                <h3 class="animated slideInUp wow">О нас</h3>

                <p class="animated slideInUp wow">Мы обслуживаем различные виды продукции. Мы стараемся реализовать все
                    самое лучшее, что можно купить по низкой цене. Мы заботимся о наших клиентах, как о своей семье </p>
            </div>

        </div>
    </div>
</div>

<div class="container contact" id="contact">
    <div class="row">
        <form action="form_handler.php" method="post" id="email_form" class="col s12 animated slideInUp wow">
            <h3 class="animated slideInUp wow">Связаться с нами</h3>
            <div class="row">
                <div class="input-field col s12 m6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="icon_prefix" name="subject" type="text" class="validate">
                    <label for="icon_prefix">Ваше имя</label>
                </div>
                <div class="input-field col s12 m6">
                    <i class="material-icons prefix">email</i>
                    <input id="email" name="reply_to" type="email" class="validate">
                    <label for="email" data-error="wrong" data-success="right">Ваша почта</label>
                </div>
                <div class="input-field col s12 ">
                    <i class="material-icons prefix">message</i>
                    <textarea id="icon_prefix2" class="materialize-textarea" type="text" name="text" rows="4"" style="
                        resize: vertical;min-height: 8rem;" required></textarea>
                    <label for="icon_prefix2">Ваше сообщение</label>
                </div>
                <input type="hidden" name="access_token" value="" />
                <input type="hidden" name="success_url" value="." />
                <input type="hidden" name="error_url" value=".?err=1" />
                <div class="center-align">
                    <button id="submit_form" type="submit" name="contact" value="Send"
                        class="button-rounded btn-large waves-effect waves-light">Отправить</button>
                </div>
            </div>

            <style>
                .form-message {
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background-color: #f1f1f1;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                    z-index: 9999;
                    text-align: center;
                    /* Центрирование текста */
                }

                .form-message .close {
                    position: absolute;
                    top: 10px;
                    right: 10px;
                    cursor: pointer;
                }
            </style>



            <div id="form_message" class="form-message" style="display: none;">
                <span class="close" onclick="closeMessage()">×</span>
                <p>Сообщение успешно отправлено.</p>
            </div> <!-- Контейнер для сообщения об отправке формы -->
        </form>
    </div>
</div>



<?php
require 'includes/secondfooter.php';
require 'includes/footer.php'; ?>
<script>
    // Получение ссылки на форму
    var form = document.getElementById('email_form');

    // Получение ссылки на кнопку отправки
    var submitButton = document.getElementById('submit_form');

    // Получение ссылки на блок сообщения
    var messageContainer = document.getElementById('form_message');

    // Обработчик события клика по кнопке отправки
    submitButton.addEventListener('click', function (event) {
        event.preventDefault(); // Отменить отправку формы по умолчанию

        // Создание объекта FormData и добавление данных формы
        var formData = new FormData(form);

        // Создание объекта XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // Настройка запроса
        xhr.open('POST', form.action, true);

        // Обработчик события загрузки
        xhr.onload = function () {
            if (xhr.status === 200) {
                // Обработка успешного ответа
                console.log(xhr.responseText);
                showSuccessMessage(); // Показать сообщение об успешной отправке
                clearForm(); // Очистить форму
            } else {
                // Обработка ошибки
                console.error('Ошибка при отправке формы. Статус: ' + xhr.status);
            }
        };

        // Отправка запроса с данными формы
        xhr.send(formData);
    });

    // Функция для показа сообщения об успешной отправке
    function showSuccessMessage() {
        messageContainer.style.display = 'block';
        document.addEventListener('click', closeMessageOutside); // Добавить обработчик события клика на весь документ
    }

    // Функция для закрытия сообщения
    function closeMessage() {
        messageContainer.style.display = 'none';
        document.removeEventListener('click', closeMessageOutside); // Удалить обработчик события клика на весь документ
    }

    // Функция для закрытия сообщения при клике вне блока сообщения
    function closeMessageOutside(event) {
        if (!messageContainer.contains(event.target)) {
            closeMessage();
        }
    }

    // Функция для очистки формы
    function clearForm() {
        form.reset();
    }
</script>