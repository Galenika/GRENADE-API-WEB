<?php
header("Content-Type: text/html; charset=utf-8");
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <title><?= $params[0] ?></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .g-recaptcha {
            transform: scale(1.084);
            transform-origin: 0 0;
            margin-bottom: 18px;
        }

        .pagination-footer {
            text-align: center;
            padding-bottom: 5px !important;
        }

        .pagination-footer ul {
            margin: 0;
        }

        .pagination-footer ul li:last-child a {
            margin-left: -2px;
        }
    </style>
    <script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#headerMenu"
                    aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><?=site_name?></a>
        </div>

        <div class="collapse navbar-collapse" id="headerMenu">
            <ul class="nav navbar-nav">
                <li><a href="../grenade/">Главная</a></li>
                <? if ($this->user) { ?>
                    <li><a href="../grenade/approved">Одобренные</a></li>
                    <li><a href="../grenade/moderating">Модерация</a></li>
                <? } ?>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <? if ($this->user) { ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"><?= $this->getUserData($this->user, "username") ?> <span
                                    class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../grenade/logout"><i class="fa fa-sign-out" style="padding-right: 10px"></i>Выйти</a>
                            </li>
                        </ul>
                    </li>
                <? } else { ?>
                    <li><a href="../grenade/auth">Войти</a></li>
                <? } ?>
            </ul>
        </div>
    </div>
</nav>