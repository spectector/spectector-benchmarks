; ModuleID = '../sources/clang/12.c'
source_filename = "../sources/clang/12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local global i32 16, align 4
@array1 = dso_local global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local global i8 0, align 1
@array2 = common dso_local global [131072 x i8] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @victim_function_v12(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = add i64 %5, %6
  %8 = load i32, i32* @array1_size, align 4
  %9 = zext i32 %8 to i64
  %10 = icmp ult i64 %7, %9
  br i1 %10, label %11, label %27

; <label>:11:                                     ; preds = %2
  %12 = load i64, i64* %3, align 8
  %13 = load i64, i64* %4, align 8
  %14 = add i64 %12, %13
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = mul nsw i32 %17, 512
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = load i8, i8* @temp, align 1
  %24 = zext i8 %23 to i32
  %25 = and i32 %24, %22
  %26 = trunc i32 %25 to i8
  store i8 %26, i8* @temp, align 1
  br label %27

; <label>:27:                                     ; preds = %11, %2
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
