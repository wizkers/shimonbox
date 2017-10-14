// Copyright (c) 2017 Clément Bœsch <u pkh.me>
//
// Permission to use, copy, modify, and distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

include <globals.scad>

use <utils.scad>

use <boards/bbb.scad>
use <boards/cubieboard.scad>
use <boards/hikey.scad>

boards = [
    ["bbb",             beaglebone_black_info()],
    ["cubieboard",      cubieboard_info()],
    ["hikey",           hikey_info()],
];

module boards_get_plate_2d(id) {
    filter(id) {
        beaglebone_black_plate_2d();
        cubieboard_plate_2d();
        hikey_plate_2d();
    }
}

module boards_get_board(id) {
    filter(id) {
        beaglebone_black();
        cubieboard();
        hikey();
    }
}

function boards_get_id(name) = search([name], boards)[0];
function boards_get_info(id) = boards[id][1];