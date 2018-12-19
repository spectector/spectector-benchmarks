; ModuleID = '../sources/clang/05.c'
source_filename = "../sources/clang/05.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local local_unnamed_addr global i32 16, align 4
@array1 = dso_local local_unnamed_addr global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local local_unnamed_addr global i8 0, align 1
@array2 = common dso_local local_unnamed_addr global [131072 x i8] zeroinitializer, align 16

; Function Attrs: norecurse nounwind sspstrong uwtable
define dso_local void @victim_function_v05(i64) local_unnamed_addr #0 {
  %2 = load i32, i32* @array1_size, align 4, !tbaa !4
  %3 = zext i32 %2 to i64
  %4 = icmp ugt i64 %3, %0
  br i1 %4, label %5, label %76

; <label>:5:                                      ; preds = %1
  %6 = trunc i64 %0 to i32
  %7 = add i32 %6, -1
  %8 = icmp sgt i32 %7, -1
  br i1 %8, label %9, label %76

; <label>:9:                                      ; preds = %5
  %10 = load i8, i8* @temp, align 1, !tbaa !8
  %11 = sext i32 %7 to i64
  %12 = and i32 %6, 3
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %30, label %14

; <label>:14:                                     ; preds = %9, %14
  %15 = phi i64 [ %27, %14 ], [ %11, %9 ]
  %16 = phi i8 [ %25, %14 ], [ %10, %9 ]
  %17 = phi i32 [ %26, %14 ], [ %7, %9 ]
  %18 = phi i32 [ %28, %14 ], [ %12, %9 ]
  %19 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %15
  %20 = load i8, i8* %19, align 1, !tbaa !8
  %21 = zext i8 %20 to i64
  %22 = shl nuw nsw i64 %21, 9
  %23 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %22
  %24 = load i8, i8* %23, align 16, !tbaa !8
  %25 = and i8 %16, %24
  %26 = add i32 %17, -1
  %27 = add nsw i64 %15, -1
  %28 = add i32 %18, -1
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %14, !llvm.loop !9

; <label>:30:                                     ; preds = %14, %9
  %31 = phi i64 [ %11, %9 ], [ %27, %14 ]
  %32 = phi i8 [ %10, %9 ], [ %25, %14 ]
  %33 = phi i32 [ %7, %9 ], [ %26, %14 ]
  %34 = phi i8 [ undef, %9 ], [ %25, %14 ]
  %35 = icmp ult i32 %7, 3
  br i1 %35, label %74, label %36

; <label>:36:                                     ; preds = %30, %36
  %37 = phi i64 [ %73, %36 ], [ %31, %30 ]
  %38 = phi i8 [ %70, %36 ], [ %32, %30 ]
  %39 = phi i32 [ %71, %36 ], [ %33, %30 ]
  %40 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %37
  %41 = load i8, i8* %40, align 1, !tbaa !8
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 9
  %44 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %43
  %45 = load i8, i8* %44, align 16, !tbaa !8
  %46 = and i8 %38, %45
  %47 = add nsw i64 %37, -1
  %48 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %47
  %49 = load i8, i8* %48, align 1, !tbaa !8
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 9
  %52 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %51
  %53 = load i8, i8* %52, align 16, !tbaa !8
  %54 = and i8 %46, %53
  %55 = add nsw i64 %37, -2
  %56 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %55
  %57 = load i8, i8* %56, align 1, !tbaa !8
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 9
  %60 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %59
  %61 = load i8, i8* %60, align 16, !tbaa !8
  %62 = and i8 %54, %61
  %63 = add nsw i64 %37, -3
  %64 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %63
  %65 = load i8, i8* %64, align 1, !tbaa !8
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 9
  %68 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %67
  %69 = load i8, i8* %68, align 16, !tbaa !8
  %70 = and i8 %62, %69
  %71 = add i32 %39, -4
  %72 = icmp sgt i32 %71, -1
  %73 = add nsw i64 %37, -4
  br i1 %72, label %36, label %74

; <label>:74:                                     ; preds = %36, %30
  %75 = phi i8 [ %34, %30 ], [ %70, %36 ]
  store i8 %75, i8* @temp, align 1, !tbaa !8
  br label %76

; <label>:76:                                     ; preds = %5, %74, %1
  ret void
}

attributes #0 = { norecurse nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
