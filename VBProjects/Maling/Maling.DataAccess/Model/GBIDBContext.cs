using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Maling.DataAccess.Model
{
    public partial class GBIDBContext : DbContext
    {
        public GBIDBContext()
        {
        }

        public GBIDBContext(DbContextOptions<GBIDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Maling> Maling { get; set; }
        public virtual DbSet<MalingSlag> MalingSlag { get; set; }
        public virtual DbSet<MalingStatus> MalingStatus { get; set; }
        public virtual DbSet<xEmballasje> xEmballasje { get; set; }
        public virtual DbSet<xHus> xHus { get; set; }
        public virtual DbSet<xLager> xLager { get; set; }
        public virtual DbSet<xMalBasis> xMalBasis { get; set; }
        public virtual DbSet<xRom> xRom { get; set; }
        public virtual DbSet<xSted> xSted { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<Maling>(entity =>
            {
                entity.HasIndex(e => e.HusID)
                    .HasName("Maling$xHusMaling");

                entity.HasIndex(e => e.MalID)
                    .HasName("Maling$MalID");

                entity.HasIndex(e => e.RomID)
                    .HasName("Maling$xRomMaling");

                entity.HasIndex(e => e.StedID)
                    .HasName("Maling$xStedMaling");

                entity.Property(e => e.MalID).HasDefaultValueSql("((0))");

                entity.Property(e => e.Ute).HasDefaultValueSql("((0))");

                entity.HasOne(d => d.Hus)
                    .WithMany(p => p.Maling)
                    .HasForeignKey(d => d.HusID)
                    .HasConstraintName("Maling$xHusMaling");

                entity.HasOne(d => d.Rom)
                    .WithMany(p => p.Maling)
                    .HasForeignKey(d => d.RomID)
                    .HasConstraintName("Maling$xRomMaling");

                entity.HasOne(d => d.Sted)
                    .WithMany(p => p.Maling)
                    .HasForeignKey(d => d.StedID)
                    .HasConstraintName("Maling$xStedMaling");
            });

            modelBuilder.Entity<MalingSlag>(entity =>
            {
                entity.HasKey(e => e.MalID)
                    .HasName("MalingSlag$ID");

                entity.HasIndex(e => e.MalBasisID)
                    .HasName("MalingSlag$xMalBasisMalingSlag");

                entity.HasOne(d => d.MalBasis)
                    .WithMany(p => p.MalingSlag)
                    .HasForeignKey(d => d.MalBasisID)
                    .HasConstraintName("MalingSlag$xMalBasisMalingSlag");
            });

            modelBuilder.Entity<MalingStatus>(entity =>
            {
                entity.HasKey(e => e.MSID)
                    .HasName("MalingStatus$ID");

                entity.HasIndex(e => e.EmbID)
                    .HasName("MalingStatus$xEmballasjeMalingStatus");

                entity.HasIndex(e => e.LagerID)
                    .HasName("MalingStatus$xLagerMalingStatus");

                entity.HasIndex(e => e.MalID)
                    .HasName("MalingStatus$MalingSlagMalingStatus");

                entity.Property(e => e.FyllGrad).HasDefaultValueSql("('Full')");

                entity.HasOne(d => d.Emb)
                    .WithMany(p => p.MalingStatus)
                    .HasForeignKey(d => d.EmbID)
                    .HasConstraintName("MalingStatus$xEmballasjeMalingStatus");

                entity.HasOne(d => d.Lager)
                    .WithMany(p => p.MalingStatus)
                    .HasForeignKey(d => d.LagerID)
                    .HasConstraintName("MalingStatus$xLagerMalingStatus");

                entity.HasOne(d => d.Mal)
                    .WithMany(p => p.MalingStatus)
                    .HasForeignKey(d => d.MalID)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("MalingStatus$MalingSlagMalingStatus");
            });

            modelBuilder.Entity<xEmballasje>(entity =>
            {
                entity.HasKey(e => e.EmbID)
                    .HasName("xEmballasje$PrimaryKey");

                entity.HasIndex(e => e.EmbID)
                    .HasName("xEmballasje$RomID");
            });

            modelBuilder.Entity<xHus>(entity =>
            {
                entity.HasKey(e => e.HusID)
                    .HasName("xHus$PrimaryKey");

                entity.HasIndex(e => e.HusID)
                    .HasName("xHus$HusID");
            });

            modelBuilder.Entity<xLager>(entity =>
            {
                entity.HasKey(e => e.LagerID)
                    .HasName("xLager$StedID");

                entity.HasIndex(e => e.lagerBenevn)
                    .HasName("xLager$Sted")
                    .IsUnique();
            });

            modelBuilder.Entity<xMalBasis>(entity =>
            {
                entity.HasKey(e => e.MalBasisID)
                    .HasName("xMalBasis$StedID");

                entity.HasIndex(e => e.MalBasisBenevn)
                    .HasName("xMalBasis$Sted")
                    .IsUnique();
            });

            modelBuilder.Entity<xRom>(entity =>
            {
                entity.HasKey(e => e.RomID)
                    .HasName("xRom$PrimaryKey");

                entity.HasIndex(e => e.RomID)
                    .HasName("xRom$RomID");
            });

            modelBuilder.Entity<xSted>(entity =>
            {
                entity.HasKey(e => e.StedID)
                    .HasName("xSted$StedID");

                entity.HasIndex(e => e.StedBenevn)
                    .HasName("xSted$Sted")
                    .IsUnique();
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}