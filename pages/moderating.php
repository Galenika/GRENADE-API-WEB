<?php
include_once "../class.php";
$panel->userRedirect(false, "../grenade");
$panel->drawTemplate("header", ["Модерация"]);
$panel->pagination("moderating");
?>

    <div class="container">
        <?php
        if (isset($_GET["view"])) {
            $id = $_GET["view"];
            $query = $panel->mysqli->query("SELECT * FROM moderating WHERE id=$id");

            if (mysqli_num_rows($query)) {
                $data = $query->fetch_object();
                $data->viewangles = json_decode($data->viewangles);
                $data->position = json_decode($data->position);

                if (isset($_POST["approve"])) {
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
                        $added_by = $panel->user;

                        $query = $panel->mysqli->query("INSERT INTO approved (title, description, map, grenade, viewangles, position, screenshot1, screenshot2, added_by) VALUES ('$title', '$description', '$map', '$grenade', '$viewangles', '$position', '$screenshot1', '$screenshot2', $added_by)");

                        if ($query !== false) {
                            $panel->mysqli->query("DELETE FROM moderating WHERE id=$id");
                            echo $panel->showAlert("success", "Предложение было успешно одобрено!") .
                                "<script>setTimeout(function() { window.location.replace(\"../grenade/moderating\"); }, 1000)</script>";
                        } else {
                            echo $panel->showAlert("danger", "Произошла ошибка при одобрение!");
                        }
                    } else {
                        echo $panel->showAlert("danger", "Произошла ошибка!");
                    }
                }

                $grenades = json_decode($data->grenade);
                $grenades_string = "";

                foreach ($grenades as $grenade)
                    $grenades_string .= unserialize(grenades)[$grenade] . ", ";

                $grenades_string = substr($grenades_string, 0, -2);

                ?>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Предложение #<?= $data->id ?></h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="POST" enctype="multipart/form-data">
                            <fieldset>
                                <div class="form-group">
                                    <label for="title">Название</label>
                                    <input class="form-control" placeholder="Название" name="title" id="title"
                                           type="text" value="<?= $data->title ?>" maxlength="32" required>
                                </div>
                                <div class="form-group">
                                    <label for="description">Описание</label>
                                    <textarea class="form-control" placeholder="Описание" name="description"
                                              id="description" rows="3" maxlength="128"
                                              required><?= $data->description ?></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="map">Карта</label>
                                    <select class="form-control" name="map" id="map">
                                        <?= $panel->arrayToSelect(unserialize(maps), $data->map) ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="grenade">Гранаты</label>
                                    <select class="form-control" name="grenade[]" id="grenade" multiple>
                                        <?= $panel->arrayToSelect2(unserialize(grenades), $grenades) ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Углы</label>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <input class="form-control" placeholder="X" name="viewangles_x"
                                                   type="number" value="<?= $data->viewangles->x ?>" step="0.001"
                                                   min="-90"
                                                   max="90" required>
                                        </div>
                                        <div class="col-xs-6">
                                            <input class="form-control" placeholder="Y" name="viewangles_y"
                                                   type="number" value="<?= $data->viewangles->y ?>" step="0.001"
                                                   min="-180"
                                                   max="180" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Позиция</label>
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <input class="form-control" placeholder="X" name="position_x" type="number"
                                                   value="<?= $data->position->x ?>" min="-15000" max="15000" step="0.001"
                                                   required>
                                        </div>
                                        <div class="col-xs-4">
                                            <input class="form-control" placeholder="Y" name="position_y" type="number"
                                                   value="<?= $data->position->y ?>" min="-15000" max="15000" step="0.001"
                                                   required>
                                        </div>
                                        <div class="col-xs-4">
                                            <input class="form-control" placeholder="Z" name="position_z" type="number"
                                                   value="<?= $data->position->z ?>" min="-15000" max="15000" step="0.001"
                                                   required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="screenshot1">Скриншот #1</label>
                                    <input class="form-control" placeholder="Скриншот #1" name="screenshot1"
                                           id="screenshot1"
                                           type="text" value="<?= $data->screenshot1 ?>" maxlength="256" required>
                                </div>
                                <div class="form-group">
                                    <label for="screenshot2">Скриншот #2</label>
                                    <input class="form-control" placeholder="Скриншот #2" name="screenshot2"
                                           id="screenshot2"
                                           type="text" value="<?= $data->screenshot2 ?>" maxlength="256" required>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <a href="../grenade/moderating?decline=<?= $data->id ?>"
                                           class="btn btn-danger btn-block">Отклонить</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <input class="btn btn-success btn-block" name="approve" type="submit"
                                               value="Одобрить">
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
                <?php
            } else {
                echo $panel->showAlert("danger", "Предложение не было найдено!");
            }
        } else {
            if ($panel->pagination_map == null && $panel->pagination_grenade == null) {
                $sql = "SELECT * FROM moderating ORDER BY id DESC LIMIT $panel->paginationStart, $panel->paginationLimit";
            } else {
                $sql = "SELECT * FROM moderating WHERE map LIKE '%$panel->pagination_map%' AND grenade LIKE '%$panel->pagination_grenade%' ORDER BY id DESC LIMIT $panel->paginationStart, $panel->paginationLimit";
            }

            if (isset($_GET["decline"])) {
                $id = $_GET["decline"];
                $query = $panel->mysqli->query("SELECT id FROM moderating WHERE id=$id");

                if (mysqli_num_rows($query)) {
                    $query = $panel->mysqli->query("DELETE FROM moderating WHERE id=$id");

                    if ($query !== false) {
                        echo $panel->showAlert("success", "Предложение было успешно отоклонено!");
                    } else {
                        echo $panel->showAlert("danger", "Произошла ошибка при отклонение предложения!");
                    }
                } else {
                    echo $panel->showAlert("danger", "Предложение не было найдено!");
                }
            }

            $query = $panel->mysqli->query($sql);
            ?>
            <form method="GET">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <select class="form-control" name="map" id="map">
                                <option value="">Любая карта</option>
                                <?= $panel->arrayToSelect(unserialize(maps), $panel->pagination_map) ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <select class="form-control" name="grenade" id="grenade">
                                <option value="">Любая граната</option>
                                <?= $panel->arrayToSelect(unserialize(grenades), $panel->pagination_grenade) ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <input class="btn btn-primary btn-block" type="submit" value="Найти">
                    </div>
                </div>
            </form>

            <div class="panel panel-default">
                <div class="panel-heading">
                    Модерация
                </div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Название</th>
                        <th width="20%">Карта</th>
                        <th width="20%">Граната</th>
                        <th width="20%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    if (mysqli_num_rows($query) > 0) {
                        while ($row = $query->fetch_object()) {
                            $grenades = json_decode($row->grenade);
                            $grenades_string = "";

                            foreach ($grenades as $grenade)
                                $grenades_string .= unserialize(grenades)[$grenade] . ", ";

                            $grenades_string = substr($grenades_string, 0, -2);
                            echo "<tr align=\"center\"><td>$row->title</td><td>" . unserialize(maps)[$row->map] . "</td><td>" . $grenades_string . "</td><td><a href=\"../grenade/moderating?view=$row->id\">Подробнее...</a></td></tr>";
                        }
                    } else {
                        echo "<tr align=\"center\"><td colspan=\"7\">Ничего не найдено!</td></tr>";
                    }
                    ?>
                    </tbody>
                </table>
                <?= $panel->paginationHTML ?>
            </div>
        <? } ?>
    </div>

<?php
$panel->drawTemplate("footer");
?>