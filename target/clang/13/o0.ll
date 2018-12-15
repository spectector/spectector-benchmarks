; ModuleID = '../sources/clang/13.c'
source_filename = "../sources/clang/13.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local global i32 16, align 4
@array1 = dso_local global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local global i8 0, align 1
@array2 = common dso_local global [131072 x i8] zeroinitializer, align 16

; Function Attrs: alwaysinline nounwind sspstrong uwtable
define dso_local i32 @is_x_safe(i64) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = load i32, i32* @array1_size, align 4
  %6 = zext i32 %5 to i64
  %7 = icmp ult i64 %4, %6
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %1
  store i32 1, i32* %2, align 4
  br label %10

; <label>:9:                                      ; preds = %1
  store i32 0, i32* %2, align 4
  br label %10

; <label>:10:                                     ; preds = %9, %8
  %11 = load i32, i32* %2, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @victim_function_v13(i64) #1 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  store i64 %5, i64* %3, align 8
  %6 = load i64, i64* %3, align 8
  %7 = load i32, i32* @array1_size, align 4
  %8 = zext i32 %7 to i64
  %9 = icmp ult i64 %6, %8
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %1
  store i32 1, i32* %2, align 4
  br label %12

; <label>:11:                                     ; preds = %1
  store i32 0, i32* %2, align 4
  br label %12

; <label>:12:                                     ; preds = %10, %11
  %13 = load i32, i32* %2, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %29

; <label>:15:                                     ; preds = %12
  %16 = load i64, i64* %4, align 8
  %17 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = mul nsw i32 %19, 512
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = load i8, i8* @temp, align 1
  %26 = zext i8 %25 to i32
  %27 = and i32 %26, %24
  %28 = trunc i32 %27 to i8
  store i8 %28, i8* @temp, align 1
  br label %29

; <label>:29:                                     ; preds = %15, %12
  ret void
}

attributes #0 = { alwaysinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
