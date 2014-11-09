<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gravadora Siqueira</title>
</head>

<?php

	$local = 'mysql:host=localhost;port=3306;dbname=db_gravadora';
	$usuario = 'root';
	$senha = 'senha do bd';
	$opcoes = array(
			PDO::ATTR_PERSISTENT => true,
			PDO::ATTR_CASE => PDO::CASE_LOWER
	);
	
	try {
		$pdo = new PDO($local, $usuario, $senha, $opcoes);
	} catch (PDOException $e) {
		echo 'Erro: '.$e->getMessage();
	}
	
	$id_musico = $_POST['id_musico'];
	

	try{
	
		$stmte = $pdo->prepare("SELECT mus.nome AS cantor, a.formato, musicas.titulo
									FROM musicos mus INNER JOIN albuns a ON mus.musico_id = a.produtor
									INNER JOIN musicas ON a.album_id = musicas.id_album
									WHERE mus.musico_id = ?;");
		$stmte->bindParam(1, $id_musico);
		$executa = $stmte->execute();
		if($executa){
			$i = 0;
			while($reg = $stmte->fetch(PDO::FETCH_OBJ)){ /* Para recuperar um ARRAY utilize PDO::FETCH_ASSOC */
				$musico = $reg->cantor;
				$formato = $reg->formato;
				$musicas[$i] = $reg->titulo;
	
				$i++;
					
			}
	
		}else{
			echo 'Erro';
		}
	} catch(PDOException $e){
		echo $e->getMessage();
	}

?>

<body>
	<?php if ($executa) {?>
	<fieldset>
		<legend>Músico <?= $musico ?></legend>
			<br />Formato do álbum: <?= $formato ?><br />
			<br />
			<?php for ($i = 0; $i < count($musicas); $i++) {?>
				<b>Música <?= $i+1 ?>: </b><?= $musicas[$i] ?> <br />
			<?php }?>

	</fieldset>
	<?php } ?>
</body>
</html>
