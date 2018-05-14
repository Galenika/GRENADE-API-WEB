<?php
include_once "class.php";
include_once "config.php";
$panel->drawTemplate("header", ["Главная страница"]);
?>

    <div class="container">
        <?php
        if (isset($_POST["suggest"])) {
            if (isset($_POST["g-recaptcha-response"]) && !empty($_POST["g-recaptcha-response"])) {
                $secret = google_secret_key;
                $verifyResponse = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secret&response=" . $_POST["g-recaptcha-response"]);
                $responseData = json_decode($verifyResponse);
                if ($responseData->success) {
                    $title = $panel->formChars($_POST["title"], 1);
                    $description = $panel->formChars($_POST["description"], 1);
                    $map = $panel->formChars($_POST["map"], 1);
                    $grenades = $_POST["grenade"];

                    $viewangles_x = $panel->formChars($_POST["viewangles_x"], 1);
                    $viewangles_y = $panel->formChars($_POST["viewangles_y"], 1);

                    $position_x = $panel->formChars($_POST["position_x"], 1);
                    $position_y = $panel->formChars($_POST["position_y"], 1);
                    $position_z = $panel->formChars($_POST["position_z"], 1);

                    $screenshot1 = $panel->formChars($_POST["screenshot1"], 1);
                    $screenshot2 = $panel->formChars($_POST["screenshot2"], 1);

                    foreach ($grenades as $key => $value)
                        $grenades[$key] = $panel->formChars($value, 1);

                    if (!(
                        (iconv_strlen($title, 'utf-8') == 0 || iconv_strlen($title, 'utf-8') > 32)
                        || (iconv_strlen($description, 'utf-8') == 0 || iconv_strlen($description, 'utf-8') > 128)
                        || !array_key_exists($map, unserialize(maps))
                        || (count($grenades) == 0 || count($grenades) > 5)
                        || ($viewangles_x < -90 || $viewangles_x > 90)
                        || ($viewangles_y < -180 || $viewangles_y > 180)
                        || ($position_x < -15000 || $position_x > 15000)
                        || ($position_y < -15000 || $position_y > 15000)
                        || ($position_z < -15000 || $position_z > 15000)
                        || (strlen($screenshot1) == 0 || strlen($screenshot1) > 256)
                        || (strlen($screenshot2) == 0 || strlen($screenshot2) > 256)
                    )
                    ) {
                        $viewangles = json_encode(["x" => $viewangles_x, "y" => $viewangles_y]);
                        $position = json_encode(["x" => $position_x, "y" => $position_y, "z" => $position_z]);
                        $grenade = json_encode($grenades);
                        $ip = $_SERVER["REMOTE_ADDR"];

                        $query = $panel->mysqli->query("INSERT INTO moderating (title, description, map, grenade, viewangles, position, screenshot1, screenshot2, ip) VALUES ('$title', '$description', '$map', '$grenade', '$viewangles', '$position', '$screenshot1', '$screenshot2', '$ip');");

                        if ($query !== false) {
                            echo $panel->showAlert("success", "Предложение было успешно отправлено!");
                        } else {
                            echo $panel->showAlert("danger", "Произошла ошибка при отправке предложения!");
                        }
                    } else {
                        echo $panel->showAlert("danger", "Проверьте правильность заполнения формы!");
                    }
                } else {
                    echo $panel->showAlert("danger", "Пожалуйста, выполните капчу!");
                }
            } else {
                echo $panel->showAlert("danger", "Пожалуйста, выполните капчу!");
            }
        }
        ?>
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Описание</h3>
                    </div>
                    <div class="panel-body">
						<h2>Инструкция по добавлению новой раскидки:</h2><br>
                        <center><iframe width="515" height="290" src="https://www.youtube.com/embed/UlGa6OQjB1w?rel=0" frameborder="0" allowfullscreen></iframe></center>
						<br><br>
						<h3>Инструкция по подключению GRENADE API к своему проекту:</h3><br>
						<ul class="list-unstyled">
						 <li>1) Скачать <a class="btn btn-primary" href="https://github.com/Blick1337/GRENADE-API" role="button" target="_blank">GRENADE API</a></li>
						 <li>2) Подключить файлы CGrenade API.cpp/.h к проекту</li>
						 <li>3) После загрузки карты в отдельном потоке выполнить:</li>
						 <li><pre>cGrenade.bUpdateGrenadeInfo(MAP_NAME);</pre>
						 Функция bUpdateGrenadeInfo вернет true если вся информация успешно получена.</li>
						 <li>4) В хуке отрисовки создать цикл:</li>
						<li><pre>for (int i = 0; i < cGrenade.GrenadeInfo.size(); i++)</pre>
						в теле цикла:<br>
						<pre>GrenadeInfo_t info;<br>if(cGrenade.GetInfo(i, &info))
	%тут выполнять отрисовку из параметров в info%</pre></li>
						</ul>
					</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Предложение</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="POST" enctype="multipart/form-data">
                            <fieldset>
                                <div class="form-group">
                                    <label for="title">Название</label>
                                    <input class="form-control" placeholder="Название" name="title" id="title"
                                           type="text" value="<?= $_POST["title"] ?>" maxlength="32" required>
                                </div>
                                <div class="form-group">
                                    <label for="description">Описание</label>
                                    <textarea class="form-control" placeholder="Описание" name="description"
                                              id="description" rows="3" maxlength="128"
                                              required><?= $_POST["description"] ?></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="map">Карта</label>
                                    <select class="form-control" name="map" id="map">
                                        <?= $panel->arrayToSelect(unserialize(maps), $_POST["map"]) ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="grenade">Гранаты</label>
                                    <select class="form-control" name="grenade[]" id="grenade" multiple>
                                        <?= $panel->arrayToSelect2(unserialize(grenades), $_POST["grenade"]) ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Углы</label>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <input class="form-control" placeholder="X" name="viewangles_x"
                                                   type="number" value="<?= $_POST["viewangles_x"] ?>" min="-90"
                                                   max="90" step="0.001" required>
                                        </div>
                                        <div class="col-xs-6">
                                            <input class="form-control" placeholder="Y" name="viewangles_y"
                                                   type="number" value="<?= $_POST["viewangles_y"] ?>" min="-180"
                                                   max="180" step="0.001" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Позиция</label>
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <input class="form-control" placeholder="X" name="position_x" type="number"
                                                   value="<?= $_POST["position_x"] ?>" min="-15000" max="15000" step="0.001"
                                                   required>
                                        </div>
                                        <div class="col-xs-4">
                                            <input class="form-control" placeholder="Y" name="position_y" type="number"
                                                   value="<?= $_POST["position_y"] ?>" min="-15000" max="15000" step="0.001"
                                                   required>
                                        </div>
                                        <div class="col-xs-4">
                                            <input class="form-control" placeholder="Z" name="position_z" type="number"
                                                   value="<?= $_POST["position_z"] ?>" min="-15000" max="15000" step="0.001"
                                                   required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="screenshot1">Скриншот #1</label>
                                    <input class="form-control" placeholder="Скриншот #1" name="screenshot1"
                                           id="screenshot1"
                                           type="text" value="<?= $_POST["screenshot1"] ?>" maxlength="256" required>
                                </div>
                                <div class="form-group">
                                    <label for="screenshot2">Скриншот #2</label>
                                    <input class="form-control" placeholder="Скриншот #2" name="screenshot2"
                                           id="screenshot2"
                                           type="text" value="<?= $_POST["screenshot2"] ?>" maxlength="256" required>
                                </div>
                                <div class="form-group">
                                    <div class="g-recaptcha"
                                         data-sitekey="<?= google_site_key ?>"></div>
                                </div>
                                <input class="btn btn-primary btn-block" name="suggest" type="submit"
                                       value="Предложить">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php
$panel->drawTemplate("footer");
?>