<?php
include_once "../class.php";

header("Content-Type: text/plain; charset=utf-8");

if (isset($_GET["map"])) {
    $map = $panel->formChars($_GET["map"], 1);
    $query = $panel->mysqli->query("SELECT * FROM approved WHERE map='$map' ORDER BY id ASC");
    if (mysqli_num_rows($query) > 0) {
		$id = -1;
        while ($row = $query->fetch_object()) {
            $row->viewangles = json_decode($row->viewangles);
            $row->position = json_decode($row->position);
            $grenades = json_decode($row->grenade);
            $grenades_string = "";

            foreach ($grenades as $grenade)
                $grenades_string .= $grenade . ",";

            $grenades_string = substr($grenades_string, 0, -1);
			$id++;
            echo "<id>$id</id>\n<name>$row->title</name>\n<description>$row->description</description>\n<grenade>$grenades_string</grenade>\n<player_x>" . $row->position->x . "</player_x>\n<player_y>" . $row->position->y . "</player_y>\n<player_z>" . $row->position->z . "</player_z>\n<view_x>" . $row->viewangles->x . "</view_x>\n<view_y>" . $row->viewangles->y . "</view_y>\n";
        }
    } else {
        echo "<error>Nothing has been found.</error>";
    }
} else {
    echo "<error>You need to specify map.</error>";
}