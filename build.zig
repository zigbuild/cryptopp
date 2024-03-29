const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "cryptopp",
        .target = target,
        .optimize = optimize,
    });

    lib.linkLibCpp();

    lib.addIncludePath("include");

    const cryptopp_Sources = &[_][]const u8 {
        "src/3way.cpp",
        "src/adler32.cpp",
        "src/algebra.cpp",
        "src/algparam.cpp",
        "src/allocate.cpp",
        "src/arc4.cpp",
        "src/aria.cpp",
        "src/ariatab.cpp",
        "src/aria_simd.cpp",
        "src/asn.cpp",
        "src/authenc.cpp",
        "src/base32.cpp",
        "src/base64.cpp",
        "src/basecode.cpp",
        "src/bench1.cpp",
        "src/bench2.cpp",
        "src/bench3.cpp",
        "src/bfinit.cpp",
        "src/blake2.cpp",
        "src/blake2b_simd.cpp",
        "src/blake2s_simd.cpp",
        "src/blowfish.cpp",
        "src/blumshub.cpp",
        "src/camellia.cpp",
        "src/cast.cpp",
        "src/casts.cpp",
        "src/cbcmac.cpp",
        "src/ccm.cpp",
        "src/chacha.cpp",
        "src/chachapoly.cpp",
        "src/chacha_avx.cpp",
        "src/chacha_simd.cpp",
        "src/cham.cpp",
        "src/cham_simd.cpp",
        "src/channels.cpp",
        "src/cmac.cpp",
        "src/cpu.cpp",
        "src/crc.cpp",
        "src/crc_simd.cpp",
        "src/cryptlib.cpp",
        "src/darn.cpp",
        "src/datatest.cpp",
        "src/default.cpp",
        "src/des.cpp",
        "src/dessp.cpp",
        "src/dh.cpp",
        "src/dh2.cpp",
        "src/dll.cpp",
        "src/dlltest.cpp",
        "src/donna_32.cpp",
        "src/donna_64.cpp",
        "src/donna_sse.cpp",
        "src/dsa.cpp",
        "src/eax.cpp",
        "src/ec2n.cpp",
        "src/eccrypto.cpp",
        "src/ecp.cpp",
        "src/elgamal.cpp",
        "src/emsa2.cpp",
        "src/eprecomp.cpp",
        "src/esign.cpp",
        "src/files.cpp",
        "src/filters.cpp",
        "src/fips140.cpp",
        "src/fipsalgt.cpp",
        "src/fipstest.cpp",
        "src/gcm.cpp",
        "src/gcm_simd.cpp",
        "src/gf256.cpp",
        "src/gf2n.cpp",
        "src/gf2n_simd.cpp",
        "src/gf2_32.cpp",
        "src/gfpcrypt.cpp",
        "src/gost.cpp",
        "src/gzip.cpp",
        "src/hc128.cpp",
        "src/hc256.cpp",
        "src/hex.cpp",
        "src/hight.cpp",
        "src/hmac.cpp",
        "src/hrtimer.cpp",
        "src/ida.cpp",
        "src/idea.cpp",
        "src/integer.cpp",
        "src/iterhash.cpp",
        "src/kalyna.cpp",
        "src/kalynatab.cpp",
        "src/keccak.cpp",
        "src/keccak_core.cpp",
        "src/keccak_simd.cpp",
        "src/lea.cpp",
        "src/lea_simd.cpp",
        "src/lsh256.cpp",
        "src/lsh256_avx.cpp",
        "src/lsh256_sse.cpp",
        "src/lsh512.cpp",
        "src/lsh512_avx.cpp",
        "src/lsh512_sse.cpp",
        "src/luc.cpp",
        "src/mars.cpp",
        "src/marss.cpp",
        "src/md2.cpp",
        "src/md4.cpp",
        "src/md5.cpp",
        "src/misc.cpp",
        "src/modes.cpp",
        "src/mqueue.cpp",
        "src/mqv.cpp",
        "src/nbtheory.cpp",
        "src/neon_simd.cpp",
        "src/oaep.cpp",
        "src/osrng.cpp",
        "src/padlkrng.cpp",
        "src/panama.cpp",
        "src/pch.cpp",
        "src/pkcspad.cpp",
        "src/poly1305.cpp",
        "src/polynomi.cpp",
        "src/power7_ppc.cpp",
        "src/power8_ppc.cpp",
        "src/power9_ppc.cpp",
        "src/ppc_simd.cpp",
        "src/primetab.cpp",
        "src/pssr.cpp",
        "src/pubkey.cpp",
        "src/queue.cpp",
        "src/rabbit.cpp",
        "src/rabin.cpp",
        "src/randpool.cpp",
        "src/rc2.cpp",
        "src/rc5.cpp",
        "src/rc6.cpp",
        "src/rdrand.cpp",
        "src/rdtables.cpp",
        "src/regtest1.cpp",
        "src/regtest2.cpp",
        "src/regtest3.cpp",
        "src/regtest4.cpp",
        "src/rijndael.cpp",
        "src/rijndael_simd.cpp",
        "src/ripemd.cpp",
        "src/rng.cpp",
        "src/rsa.cpp",
        "src/rw.cpp",
        "src/safer.cpp",
        "src/salsa.cpp",
        "src/scrypt.cpp",
        "src/seal.cpp",
        "src/seed.cpp",
        "src/serpent.cpp",
        "src/sha.cpp",
        "src/sha3.cpp",
        "src/shacal2.cpp",
        "src/shacal2_simd.cpp",
        "src/shake.cpp",
        "src/shark.cpp",
        "src/sharkbox.cpp",
        "src/sha_simd.cpp",
        "src/simeck.cpp",
        "src/simon.cpp",
        "src/simon128_simd.cpp",
        "src/simple.cpp",
        "src/skipjack.cpp",
        "src/sm3.cpp",
        "src/sm4.cpp",
        "src/sm4_simd.cpp",
        "src/sosemanuk.cpp",
        "src/speck.cpp",
        "src/speck128_simd.cpp",
        "src/square.cpp",
        "src/squaretb.cpp",
        "src/sse_simd.cpp",
        "src/strciphr.cpp",
        "src/tea.cpp",
        "src/test.cpp",
        "src/tftables.cpp",
        "src/threefish.cpp",
        "src/tiger.cpp",
        "src/tigertab.cpp",
        "src/ttmac.cpp",
        "src/tweetnacl.cpp",
        "src/twofish.cpp",
        "src/validat0.cpp",
        "src/validat1.cpp",
        "src/validat10.cpp",
        "src/validat2.cpp",
        "src/validat3.cpp",
        "src/validat4.cpp",
        "src/validat5.cpp",
        "src/validat6.cpp",
        "src/validat7.cpp",
        "src/validat8.cpp",
        "src/validat9.cpp",
        "src/vmac.cpp",
        "src/wake.cpp",
        "src/whrlpool.cpp",
        "src/xed25519.cpp",
        "src/xtr.cpp",
        "src/xtrcrypt.cpp",
        "src/xts.cpp",
        "src/zdeflate.cpp",
        "src/zinflate.cpp",
        "src/zlib.cpp",
    };

    const cryptopp_Flags = &[_][]const u8 {
        "-std=c++11",
    };

    lib.addCSourceFiles(cryptopp_Sources, cryptopp_Flags);

    lib.installHeadersDirectory("include", "cryptopp");
    b.installArtifact(lib);
}