; ModuleID = '../sources/clang/15.c'
source_filename = "../sources/clang/15.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local global i32 16, align 4
@array1 = dso_local global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local global i8 0, align 1
@array2 = common dso_local global [131072 x i8] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @victim_function_v15(i64*) #0 {
  %2 = alloca i64*, align 8
  store i64* %0, i64** %2, align 8
  %3 = load i64*, i64** %2, align 8
  %4 = load i64, i64* %3, align 8
  %5 = load i32, i32* @array1_size, align 4
  %6 = zext i32 %5 to i64
  %7 = icmp ult i64 %4, %6
  br i1 %7, label %8, label %23

; <label>:8:                                      ; preds = %1
  %9 = load i64*, i64** %2, align 8
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = mul nsw i32 %13, 512
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = load i8, i8* @temp, align 1
  %20 = zext i8 %19 to i32
  %21 = and i32 %20, %18
  %22 = trunc i32 %21 to i8
  store i8 %22, i8* @temp, align 1
  br label %23

; <label>:23:                                     ; preds = %8, %1
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
