import org.scalatest.Tag
import org.scalatest.funsuite.AnyFunSuiteLike

import java.io.{File, FileInputStream, FileOutputStream}
import java.util.zip.{ZipEntry, ZipOutputStream}
import scala.collection.parallel.CollectionConverters.*
class MainTest extends AnyFunSuiteLike:
  test("Generate designs for website", Tag("synthesis")):
    val designSpace =
      (for
        transform <- Vector("dft", "dftcompact", "wht", "whtcompact", "idft", "idftcompact")
        n <- 1 to 4
        k <- 1 to n
        r <- 1 to k
        if n % r == 0
        hw <- Vector("char", "short", "int", "long", "half", "float", "double", "bfloat16")
      yield
        (transform, n, k, r, hw)) ++
        (for
          transform <- Vector("bitrev", "stride")
          n <- 2 to 5
          k <- 1 to n
          r <- 1 until n
          if transform == "stride" || n % r == 0
          hw <- Vector("char", "short", "int", "long", "half")
        yield
          (transform, n, k, r, hw))


    val archive = new ZipOutputStream(new FileOutputStream("web.zip"))

    for n <- 1 to 15 do
      println(s"Generating for n=$n")
      println(s"-------------------")
      println
      designSpace.filter((_, _n, _, _, _) => n == _n).par.foreach((transform, n, k, r, hw) =>
        val name = s"$transform-$n-$k-$r-$hw"
        Main.main(s"-zip -nologo -o $name.zip -testbench -n $n -k $k -r $r ${if transform `contains` "compact" then "-dualramcontrol " else ""}-hw ${if (transform `contains` "idft") || (transform `contains` "idftcompact") || (transform `contains` "dft") then "complex " else ""}$hw $transform".split(" "))
      )
      designSpace.filter((_, _n, _, _, _) => n == _n).foreach((transform, n, k, r, hw) =>
        val name = s"$transform-$n-$k-$r-$hw"
        archive.putNextEntry(new ZipEntry(s"$name.zip"))
        val in = new FileInputStream(s"$name.zip")
        val data = new Array[Byte](2048)
        var b = in.read(data, 0, 2048)
        while b != -1 do
          archive.write(data, 0, b)
          b = in.read(data, 0, 2048)
        //in.transferTo(archive)
        in.close()
        archive.closeEntry()
        new File(s"$name.zip").delete()
      )
    archive.close()
    println("Generated web.zip")