#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-

class DZ_dz2bin_test < Test::Unit::TestCase

  # to_bytes("AABBCC") -> "\xAA\xBB\xCC"
  def to_bytes(b)
    [b].pack('H*')
  end

  def test_empty_string
    assert_equal('', DZ.dz2bin(''))
  end

  def test_only_a_comment
    assert_equal('', DZ.dz2bin('#'))
    assert_equal('', DZ.dz2bin('# foo'))
    assert_equal('', DZ.dz2bin('   # foo'))
  end

  def test_empty_lines
    assert_equal('', DZ.dz2bin("\n\n\n"))
  end

  def test_no_hexa
    assert_equal('', DZ.dz2bin("lol\n# something\n | ---- $<%"))
  end

  def test_one_byte
    assert_equal(to_bytes('00'), DZ.dz2bin('00'))
    assert_equal(to_bytes('42'), DZ.dz2bin('42'))
    assert_equal(to_bytes('AF'), DZ.dz2bin('AF'))
    assert_equal(to_bytes('FF'), DZ.dz2bin('FF'))
  end

  def test_two_bytes
    assert_equal(to_bytes('0000'), DZ.dz2bin('00 00'))
    assert_equal(to_bytes('4237'), DZ.dz2bin('42 37'))
    assert_equal(to_bytes('AF10'), DZ.dz2bin('AF 10'))
    assert_equal(to_bytes('FFDC'), DZ.dz2bin('FF DC'))
  end

  def test_two_bytes_stuff_between
    assert_equal(to_bytes('0000'), DZ.dz2bin('00 x 00'))
    assert_equal(to_bytes('4237'), DZ.dz2bin('42 $$ 37'))
    assert_equal(to_bytes('AF10'), DZ.dz2bin('AF **** 10'))
    assert_equal(to_bytes('FFDC'), DZ.dz2bin('FF <!---> DC'))
  end

  def test_two_bytes_different_lines
    assert_equal(to_bytes('4237'), DZ.dz2bin("42\n37"))
  end

  def test_multiple_bytes
    assert_equal(to_bytes('4237AB'), DZ.dz2bin(%q[
        42 # <-- here is 42
        37 |-------| AB
    ]))
  end

end
